---
layout: page
title: Ingress Gateway Config
parent: Continuous Experimentation
grand_parent: Material
nav_order: 2
---

# {{page.title}}

In this exercise, you will configure an Istio Ingress *Gateway* and a *VirtualService* to make an instrumented application accessible outside of your cluster.


## Create a Deployment and a Service

As a first step, we are installing a *Deployment* and a *Service*.
This is a standard installation that everyone should have seen at this point of the course.
Please note the addition of the two labels `app` and `version`, these are expected by Istio convention and can be used later to define subsets.

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: lib-v1
  labels: { app: lib, version: v1 }
spec:
  replicas: 1
  selector:
    matchLabels: { app: lib, version: v1 }
  template:
    metadata:
      labels: { app: lib, version: v1 }
    spec:
      containers:
      - name: lib
        image: proksch/istio-example-lib:0.0.1
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: lib
  labels:
    app: lib
    service: lib
spec:
  selector:
    app: lib
  ports:
    - name: http-myport
      port: 1234
      targetPort: 8080
```

Once applied to the cluster, you should be able to test correct deployment by running `minikube service lib` for temporarily creating a port-forward.


## Creating a Gateway

In previous exercises, we have always used an `nginx` *Ingress* that comes preconfigured with Minikube.
However, Istio has its own style of defining the *Ingress* to the cluster.

In the previous part of the exercise, you have used `istioctl install` to setup the cluster.
This has already created an *IngressGateway* in the `istio-system` namespace for you.

    $ kubectl get pods -n istio-system
    NAME                                    READY   STATUS    RESTARTS      AGE
    ...
    istio-ingressgateway-864db96c47-5j6rt   1/1     Running   0             46h

As the next step, you need to define a *Gateway* and link it to this *IngressGateway*.
The connection is made by providing the right selector, which should be `istio: ingressgateway` for a default installation.

The *Gateway* definition also needs to declare the listening port and the name of the host for which it will handle the connections.
In this exercise, we will listen on port 80 and react to all domain names.


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



## Define a VirtualService


It is now required to define a *VirtualService* that connects the *Gateway* with an actual *Service*.
The configured `match` is trivial for this example, but can contain advanced matchers, e.g., to react to specific information contained in the request header.

In this example, all requests below `/` will be forwarded to the `lib` service.

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
            host: lib
```



## Accessing the Service

This is already all the preparation that is required for a minimal example.
The only required step that is necessary for our Docker-based installation is the creation of a tunnel to the Minikube container.

    $ minikube tunnel

You are now able to open [localhost](http://localhost/) in your browser or via `curl` to see the output of the `lib` service.

    $ curl localhost
    {
      "version": "0.0.1"
    }
