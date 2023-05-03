---
layout: page
title: Services & Ingress
parent: Kubernetes
grand_parent: Material
nav_order: 2
---

# {{page.title}}

A *Pod* is not meant to be accessed publicly, instead the communication through *Services* and *Ingresses*.
We will define both in this exercise, to illustrate the capabilities of both resource types.


## Create a Service

Search the Kubernetes documentation for *Service*, you will find an exhaustive documentation of the [Service][k8s-service] resource.
Within that document, find the section on *Publishing Services (ServiceTypes)* and read about the difference between `ClusterIP` and `NodePort`.

In a nutshell, `ClusterIP` is the default and is all that you need to understand if you use Kubernetes properly.
However, a `NodePort` service is easier to understand, so we start with a `NodePort` example.
Copy the previous `simple-pod.yml` example to a new file `service.yml` and append `NodePort` example.


[k8s-service]: https://kubernetes.io/docs/concepts/services-networking/service/


```yml
# service.yml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
    - port: 1234
      targetPort: 80
```
Apply this configuration. Kubernetes will find both resources in the file and create them in the cluster.

    $ kubectl apply -f service.yml
    pod/nginx created
    service/my-service created

The remaining challenge is to find how to access the service through the node port.
You have to do two things, find the port that has been automatically been selected and find the IP of the node.

    $ kubectl get services
    NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
    my-service   NodePort    10.100.239.117   <none>        1234:32629/TCP   22m
    ...
    $ kubectl get nodes -o wide
    NAME       STATUS   ROLES           AGE    VERSION   INTERNAL-IP    EXTERNAL-IP   ...
    minikube   Ready    control-plane   158m   v1.26.3   192.168.49.2   <none>        ...

From this output, you can see that the relevant IP and port of the node is `192.168.49.2:32629`.

Due to the virtualization setup of Minikube, this address is not accessible from your local machine though and a tunnel is required.
Minikube can help you with this, you can ask it to list all configured services and to create such a tunnel for a service.

    $ minikube service list
    |----------------------|------------------------------------|--------------|-----|
    |      NAMESPACE       |                NAME                | TARGET PORT  | URL |
    |----------------------|------------------------------------|--------------|-----|
    ...
    | default              | my-service                         |         1234 |     |
    ...
    |----------------------|------------------------------------|--------------|-----|
    $ minikube service my-service --url
    http://127.0.0.1:50461

The command is blocking, as long as it is running, you can open the URL in your browser and you will see the `nginx` status page.
You can abort the tunneling with `Ctrl+C`.

If the networking setup sounds very complex and confusing, do not despair.
In addition to what has been covered in the lecture, the local setup with Minikube adds one more virtualization layer around everything.
You do not have to understand every networking detail, however, we strongly recommend to get at least a grasp of the basics.
This will help you immensely when debugging issues later.

In a *normal* setup, in which your computer is in the same network as all Kubernetes *nodes*, no tunnel is required and you can directly access node ports.

{:.info}
If you are really desperate, you can use the *Virtual Box* driver for Minikube.
This makes it possible to access nodes directly, however, the tradeoff is that you must install Virtual Box.






## Create an Ingress

It is discouraged to operate services on NodePorts as this limits the flexibility of the setup.
Instead, a deployment should only use *internal services* and expose them by making use of an *Ingress*.
This allows to define complex routing rules, like matching services based on the *domain* or the *path* that has been used in a request.
In this step, we will create such an *Ingress*.

{:.info}
Make sure that you have enable an ingress controller before (`minikube addons enable ingress`).

Search again in the Kubernetes docs for information about [Ingress][k8s-ingress] resources.
You will be able to find some screenshots from the lecture in this article.
The article introduces several *Types of Ingress* examples.
We recommend you to skim the *simple fanout* to understand how powerful an *Ingress* is.
For this exercise, however, we will use the example of an *Ingress backed by a single Service*.

We will copy this config snippet and extend our previous example.
Copy your `service.yml` to a file called `ingress.yml` and append the Ingress example to the end.
As a notable difference to before, we have removed the `NodePort` from the service, which makes it default to the `ClusterIP` type.

```yml
# ingress.yml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  containers:
  - name: nginx
    image: nginx:1.14.2
    ports:
    - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: nginx
  ports:
    - port: 1234
      targetPort: 80
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
spec:
  defaultBackend:
    service:
      name: my-service
      port:
        number: 1234
```

Please note that the port that is defined in the *Ingress* is the port of the *Service*.
An *Ingress* itself does not have a port, the relevant port is determined by the *Ingress Controller*.

Once you have applied the `ingress.yml` , you can ask Minikube again for the available services.
You will see that `my-service` is no longer accessible, the only available ports are from the *Ingress*.

    $ minikube service list
    |----------------------|------------------------------------|--------------|-----|
    |      NAMESPACE       |                NAME                | TARGET PORT  | URL |
    |----------------------|------------------------------------|--------------|-----|
    ...
    | default              | my-service                         | No node port |     |
    | ingress-nginx        | ingress-nginx-controller           | http/80      |     |
    |                      |                                    | https/443    |     |
    ...
    |----------------------|------------------------------------|--------------|-----|

Due to the limitations of the Minikube virtualization through the Docker network, we still need to create a tunnel to access the Ingress.
You can execute `minikube tunnel` to open the ingress ports on `localhost`.
As ports 80 and 443 are priviledged, you will need to give Minikube root permissions for this to work.
Afterwards, you can open [localhost](http://localhost/) to see the `nginx` status page without any node port.

To finish the exercise, delete the resources from the cluster (`kubectl delete -f ingress.yml`).


[k8s-ingress]: https://kubernetes.io/docs/concepts/services-networking/ingress/

