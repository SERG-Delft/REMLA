---
layout: page
title: Create a Deployment
parent: Kubernetes
grand_parent: Material
nav_order: 3
---

# {{page.title}}

*Pods* are ephemeral units in Kubernetes and should not be manually configured.
Instead, workload resources like a *Deployment* should be used.
In this example, we will create such a *Deployment* and use it with a *Service*.

## Create Basic Setup

We will adapt the very first example that the documentation of [Deployment][k8s-deployment] provides us with.
Instead of using an `nginx` container, we will use the specialized container `proksch/showenv` that shows additional information, like the hostname or the defined environment variables.

Create a new file `deployment.yml` and save it with the following content.


[k8s-deployment]: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: showenv-deployment
  labels:
    app: showenv
spec:
  replicas: 3
  selector:
    matchLabels:
      app: showenv
  template:
    metadata:
      labels:
        app: showenv
    spec:
      containers:
      - name: showenv
        image: proksch/showenv
        ports:
        - containerPort: 8080
```

When compared to the `simple-pod.yml` example, two things stick out:

- The *Pods* are no longer directly configured, instead, a *Deployment* just provides a template spec that defines how *Pods* can be created on demand.
- A *Deployment* has a replication factor that determines how many *Pods* need to be spawned simultaneously.

Apart form these two difference, the definition of the *Deployment* looks very similar to the previous example.
To make the example easier to inspect, we also add a *Service* and an *Ingress*.

Append the following configuration to the `deployment.yml` file.

```yml
...
---
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: showenv
  ports:
    - port: 1234
      targetPort: 8080
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

Apply the configuration and list the pods in your cluster.
Once all *Pods* are in the state `Running`, create a tunnel for the *Ingress* and open [localhost](http://localhost/) in your browser.
Refreshing the browser will show you that a *Service* is a load balancer that alternates between all three instances.

    $ kubectl apply -f deployment.yml
    deployment.apps/showenv-deployment created
    service/my-service created
    $ kubectl get pods
    NAME                                  READY   STATUS              RESTARTS   AGE
    showenv-deployment-79dbf5666c-65rfw   1/1     Running             0          3s
    showenv-deployment-79dbf5666c-gggnj   0/1     ContainerCreating   0          3s
    showenv-deployment-79dbf5666c-kst52   0/1     ContainerCreating   0          3s
    $ minikube tunnel

Kill one of the *Pods* to put the *self-healing* capabilities of Kubernetes to a test.
When you inspect the status of your *Pods* afterwards, you will see that Kubernetes has automatically scheduled the creation of a new container to get back to the *desired state*.

    $ kubectl delete pod showenv-deployment-79dbf5666c-65rfw
    pod "showenv-deployment-79dbf5666c-65rfw" deleted
    $ kubectl get pods
    NAME                                  READY   STATUS              RESTARTS   AGE
    showenv-deployment-79dbf5666c-4d74f   0/1     ContainerCreating   0          1s
    showenv-deployment-79dbf5666c-gggnj   1/1     Running             0          21m
    showenv-deployment-79dbf5666c-kst52   1/1     Running             0          21m



## Scale the Deployment

Your *Deployment* has a hard-coded number of replicas, however, this number might be too small in practice.
Assume that the service receives a higher load at the moment, so we want to increate the replication factor to 10.
Adjust the `deployment.yml` file accordingly.

```yml
  replicas: 10
```

Re-apply the config and check the status of your *Pods*.
You will see that Kubernetes has realized that the current state lacks 7 containers and starts to create them.

    $ kubectl apply -f deployment.yml
    $ kubectl get pods
    NAME                                  READY   STATUS              RESTARTS   AGE
    showenv-deployment-79dbf5666c-57nx6   0/1     ContainerCreating   0          4s
    showenv-deployment-79dbf5666c-5kx6g   0/1     ContainerCreating   0          4s
    showenv-deployment-79dbf5666c-65rfw   1/1     Running             0          7m42s
    showenv-deployment-79dbf5666c-fc4j6   1/1     Running             0          4s
    showenv-deployment-79dbf5666c-gggnj   1/1     Running             0          7m42s
    showenv-deployment-79dbf5666c-jsfbs   1/1     Running             0          4s
    showenv-deployment-79dbf5666c-kst52   1/1     Running             0          7m42s
    showenv-deployment-79dbf5666c-w45l9   0/1     ContainerCreating   0          4s
    showenv-deployment-79dbf5666c-whnsd   0/1     ContainerCreating   0          4s
    showenv-deployment-79dbf5666c-wrlkt   0/1     ContainerCreating   0          4s

Your laptop has likely less than 10 cores, it might take some time before all containers are started and the system is stabil.
Refresh the website to see that the website alternates between the 10 instances.
Scaling is also possible in the other direction.
Reduce your replicas back to 3 and re-apply the config.
When you check the status of your *Pods* again, you will see that all excess containers were deleted.


To finish the exercise, delete the resources from the cluster (`kubectl delete -f deployment.yml`).

