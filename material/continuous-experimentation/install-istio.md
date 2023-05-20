---
layout: page
title: Install Istio
parent: Continuous Experimentation
grand_parent: Material
nav_order: 1
---

# {{page.title}}

In this exercise, you will update your minikube cluster and install the Istio service mesh, including several useful tools and extensions.
Before you start this exercise, make sure that you have read the getting started documentation in [Istio Concepts][istio-concepts] to get a grasp of basic terminology.

[istio-concepts]: https://istio.io/latest/docs/concepts/


## Upgrade Minikube

Istio will start a number of additional containers that act as a proxy for the existing ones.
In addition, we will host multiple versions of an application at the same time, which puts additional pressure on the Docker system.
Make sure that you allocate enough resources to your Minikube cluster.

You likely have a Minikube installation already.
It is recommended to delete the existing installation and create a new one with higher resources.
The Istio installation instructions recommend 4 CPU cores and 16GB of main memory.
It might work with less, you will receive strange errors, if it does not.

    $ minikube delete
    ...
    $ minikube start --memory=16384 --cpus=4

## Install Istio

Follow the next steps to download `istioctl` and install Istio in your cluster.
Our instructions should be sufficient, but you can find more detailed instructions in the [installation guide][istio-install].

At the time of writing, the current version is [Istio 1.17.2][istio-release].
Download the archive that corresponds with your system architecture and OS and unpack it somewhere on your system.

The Istio folder contains a subfolder called `bin`, which contains `istioctl`, a handy CLI util that allows you to interact with Istio.
It is optional, but recommended to add the `bin` folder to your `PATH` variable, so you can execute the command from everywhere, similar to `kubectl`.

[istio-install]: https://istio.io/latest/docs/setup/install/istioctl/
[istio-release]: https://github.com/istio/istio/releases/tag/1.17.2

Once `istioctl` is available, it becomes trivial to install Istio in your cluster.
Just make sure that you have started your Minikube cluster before.

    $ istioctl install
    This will install the Istio 1.17.2 default profile ...
    ✔ Istio core installed
    ✔ Istiod installed
    ✔ Ingress gateways installed
    ✔ Installation complete

At this point, your cluster is prepared to run an Istio service mesh.

## Install an Example App

As a starting example, we will deploy a basic pod into the cluster.
Create the file `simple-pod.yml` and save it with the following contents.

```yml
# simple-pod.yml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
```

Apply this configuration to your cluster and check the state of your *Pods*.

    $ kubectl apply -f simple-pod.yml
    pod/nginx created
    $ kubectl get pods
    NAME    READY   STATUS    RESTARTS   AGE
    nginx   1/1     Running   0          5s

While `nginx` will start without problems, the status output shows that the *Pod* only contains a single container.
We must instruct Istio to inject its proxy containers automatically.

Like with many other resources in Kubernetes, auto-discovery is enabled by adding the right labels.
Conveniently, a label can be added to a complete namespace to instrument *all* (new) pods in that namespace.
For the example, we will add this capability to the *default* namespace.


    $ kubectl label ns default istio-injection=enabled
    namespace/default labeled
    $ kubectl get ns default --show-labels
    NAME      STATUS   AGE   LABELS
    default   Active   12m   istio-injection=enabled

Redeploying the simple application will now automatically add the Istio proxy to the *Pod*.

    $ kubectl delete -f simple-pod.yml
    pod "nginx" deleted
    $ kubectl apply -f simple-pod.yml
    pod/nginx created
    $ kubectl get pods
    NAME    READY   STATUS    RESTARTS   AGE
    nginx   2/2     Running   0          7s

Notice the `2/2`. This number indiates that this *Pod* now has 2 containers and that both are running.
This shows that the proxy container has been added to the `nginx` *Pod*. 
If you run `kubectl get pod -A` you will notice that this number will remain `1/1` for all other, unlabeled namespaces.



## Install Istio Addons

We will also install several Istio addons for monitoring and visualization.
You can find the install files in the downloaded Istio folder in `samples/addons/`.

Prometheus is the general monitoring backend in your cluster.

    $ kubectl apply -f istio-1.17.2/samples/addons/prometheus.yaml
    serviceaccount/prometheus created
    configmap/prometheus created
    clusterrole.rbac.authorization.k8s.io/prometheus created
    clusterrolebinding.rbac.authorization.k8s.io/prometheus created
    service/prometheus created
    deployment.apps/prometheus created

Jaeger is a tracing tool that monitors the requests in the data plane of your Istio installation.

    $ kubectl apply -f istio-1.17.2/samples/addons/jaeger.yaml
    deployment.apps/jaeger created
    service/tracing created
    service/zipkin created
    service/jaeger-collector created

Kiali is a visualizaton tool that allows exploring cluster setup and inspecting the internal communication.

    $ kubectl apply -f istio-1.17.2/samples/addons/kiali.yaml
    serviceaccount/kiali created
    configmap/kiali created
    clusterrole.rbac.authorization.k8s.io/kiali-viewer created
    clusterrole.rbac.authorization.k8s.io/kiali created
    clusterrolebinding.rbac.authorization.k8s.io/kiali created
    role.rbac.authorization.k8s.io/kiali-controlplane created
    rolebinding.rbac.authorization.k8s.io/kiali-controlplane created
    service/kiali created
    deployment.apps/kiali created

You can check that the dashboards are working by executing `istioctl dashboard prometheus` and `istioctl dashboard kiali`.
Explore the Kiali interface: make sure that you select the `default` namespace and try to find the idle deployment graph of `nginx`.

A second very useful information of Kiali is the *Istio Config* section, which can often contain useful hints, when a configuration is invalid or not working as expected.

Finally, check your cluster for any open issues in your Istio configuration.

    $ istioctl analyze
    ✔ No validation issues found when analyzing namespace: default.

This command can also be used later to validate more complex deployments of user-configured resources.
If the command does not report any issues, you are done with this part.

