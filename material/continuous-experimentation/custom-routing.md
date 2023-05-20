---
layout: page
title: Custom Routing
parent: Continuous Experimentation
grand_parent: Material
nav_order: 3
---

# {{page.title}}

In this exercise part, we will deploy a more complex application with a frontend service ("app") and a library service ("lib").
We will deploy two application versions and use Istio's traffic management capabilities for a canary release: we will re-route a small portion of the traffic to the newer version.

## Create the Deployments and Services

First, we need to define two *Deployments* for `lib` and `app`.
For brevity, the following snippet only includes *Deployments* for `istio-example-lib:0.0.1` and `istio-example-app:0.0.1`.

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: lib-v1
  labels: { app: lib, version: v1}
spec:
  replicas: 2
  selector:
    matchLabels: { app: lib, version: v1}
  template:
    metadata:
      labels: { app: lib, version: v1}
    spec:
      containers:
      - name: lib
        image: proksch/istio-example-lib:0.0.1
        ports:
        - containerPort: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-v1
  labels: { app: app, version: v1}
spec:
  replicas: 2
  selector:
    matchLabels: { app: app, version: v1}
  template:
    metadata:
      labels: { app: app, version: v1}
    spec:
      containers:
      - name: app
        image: proksch/istio-example-app:0.0.1
        ports:
        - containerPort: 8080
        env:
        - name: LIB_URL
          value: http://lib:1234/
```

Duplicate these two definitions and create *Deployments* for `istio-example-lib:0.0.2` and `istio-example-app:0.0.2` as well.
Update the names to `...-v2` for the two additional *Deployments* and use the label `version: v2`.

{:.info}
Do not update the first line. The `apiVersion: v1` is the version of the resource definition and has nothing to do with your concrete deployment.

It is also required to introduce *Services* for both *Deployments*.
Duplicate the following *Service* and update all references from `lib` to `app` in the second variant.

```yml
apiVersion: v1
kind: Service
metadata:
  name: lib
spec:
  selector:
    app: lib
  ports:
    - name: http
      port: 1234
      targetPort: 8080
```

You can test whether the deployment is working with a `minikube service app`.
The website should show you a basic JSON object that contains the versions of `lib` and `app`.
Refreshing the browser should result in random combinations of the versions `0.0.1` and `0.0.2`.


    {
    	lib: 0.0.1
    	app: 0.0.2
    }

If you can see an output like this, you know that the basic deployment was successful.

## Define Subsets via Destination Rules

So far, both *Services* are being served in a *round-robin* fashion.
We can use Istio to control this behavior though.
As a first step, we need to introduce two *DestinationRules*, one for each *Service*, which define respective subsets `v1` and `v2`.

```yml
apiVersion: networking.istio.io/v1alpha3
kind: DestinationRule
metadata:
  name: lib
spec:
  host: lib
  subsets:
  - name: v1
    labels:
      version: v1
  - name: v2
    labels:
      version: v2

```

This only introduces subsets for `lib`.
Repeat this for `app` and apply both definitions to your cluster.



## Create the Virtual Services (and the Gateway)

We need to update the *VirtualService* that is repsonsible for handling all incoing requests from the *Gateway*.
The *Service* still registers for all requests below `/`.
The main change from the previous part of the exercise is that it now has two destinations with different `subsets` and different `weights`.

```yml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: my-entry-service
spec:
  gateways:
    - my-gateway
  hosts:
  - "*"
  http:
  - match:
    - uri:
        prefix: /
    route:
    - destination:
        host: app
        subset: v1
      weight: 90
    - destination:
        host: app
        subset: v2
      weight: 10
```

We also still need a *Gateway* for the overall deployment of the application.
The configuration has not changed from the previous part.

```yml
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: my-gateway
spec:
  selector:
    istio: ingressgateway
  servers:
    - port:
        number: 80
        name: http
        protocol: HTTP
      hosts:
        - "*"
```

After a `minikube tunnel`, accessing [localhost](http://localhost/) in your browser or via `curl` should reveal the JSON object that we have seen before.
This time, however, the app version should refer to `0.0.1` most of the time and only a fraction of the request will show `0.0.2`.
This should reflect the 90/10 `weights` of the two different subsets and illustrates the routing capabilities of Istio.


## Fix Subsequent Calls

The current *Deployment* has a obvious short-coming.
Usually, all application components need to be deployed together, as different versions are imcompatible with each other.
However, the accessed `lib` version simply alternates between `v1` and `v2` right now and is often not aligned with `app`.

This behavior is easy to explain.
It is not required to define a *VirtualService* for each declared *Service*.
When absent (like for `lib` at the moment), the routing will simply fall back onto the declared *Services*, which represents a basic *round-robin* load balancer.

This behavior can be easily changed with Istio.
All that is required is the introduction of a *VirtualService* for `lib` that uses a `sourceLabel` matcher for the version label.

```yml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: lib
spec:
  hosts:
  - lib
  http:
  - match:
    - sourceLabels:
        version: v2
    route:
    - destination:
        host: lib
        subset: v2
  - route:
    - destination:
        host: lib
        subset: v1
```

The `http` directions are interpreted as a sequence and the first match is used to handle the request.
It is considered good style to end the list with a *catch all* block to avoid undefined requests that do not match with any entry.
In the concrete example, `lib` version `v2` is served, when the request contains a corresponding `v2` label.
If not, the matcher falls back to `lib` in `v1`.

Reloading the page now will still follow the 90/10 distribution between `v1`/`v2` that has been configured before.
However, at this point, the versions of `app` and `lib` are always consistent.

Use `istioctl dashboard kiali` again and inspect the graph once more.
Select the `default` namespace and set interval and refresh to meaningful values (e.g., 3min and 10s).
Once you reload the website, the graph will reflect the actual topology of the deployment.




