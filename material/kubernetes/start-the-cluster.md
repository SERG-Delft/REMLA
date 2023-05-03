---
layout: page
title: Start the Cluster
parent: Kubernetes
grand_parent: Material
nav_order: 1
---

# {{page.title}}

This exercise series present a getting started guide for your first Kubernetes deployment.
To follow the exercises, please create a new folder somewhere, e.g., in your home directory.
All exercises assume that this new folder is your current working directory.

## Start your Minikube cluster

Before anything else, you need to start your `minikube` setup.

```
$ minikube start
😄  minikube v1.30.1 on Darwin 12.4
✨  Using the docker driver based on existing profile
...
🐳  Preparing Kubernetes v1.26.3 on Docker 23.0.2 ...
...
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

You also need to enable the ingress addon *once*, we will need that later.

    $ minikube addons enable ingress

Once Minikube is installed, your `kubectl` command should be configured automatically.
Test it by requesting information about your cluster.

    $ kubectl cluster-info
    Kubernetes control plane is running at https://127.0.0.1:63875
    CoreDNS is running at https://127.0.0.1:63875/...

Finally, you can open a dashboard that is offered by `minikube`.

    $ minikube dashboard
    🔌  Enabling dashboard ...
    ...
    🎉  Opening http://127.0.0.1/... in your default browser.

The command should automatically open a browser window.
If not, copy the URL from the terminal.
Explore the dashboard and try to find the different resource types from the discussion in the lecture.

{:.info}
*Tip:* Keep the terminal window open, so the Dashboard will stay active throughout the exercises.


## Start a Pod

The extensive [Kubernetes docs][k8s-docs] will become your best friend.
The search tool is a quick way to find useful examples for the different resource types.
For now, search for `pods`, you should get an [Introduction to Pods][k8s-pods] as the first hit.
Copy the first example (*simple-pod.yml*) to your local folder.

[k8s-docs]: https://kubernetes.io/docs/
[k8s-pods]: https://kubernetes.io/docs/

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

Apply this file to your cluster and check the status of your pods again.
You will see that an nginx pod has been started.
You can use the option `-o wide` for additional information or `describe` to receive a detailed breakdown of the available configuration for the resource.

    $ kubectl apply -f simple-pod.yml
    pod/nginx created
    $ kubectl get pods
    NAME    READY   STATUS    RESTARTS   AGE
    nginx   1/1     Running   0          54s
    $ kubectl get pods -o wide
    NAME    READY   STATUS    RESTARTS   AGE     IP          NODE      NOMINATED NODE  READINESS GATES
    nginx   1/1     Running   0          1m21s   10.244.0.8  minikube  <none>          <none>
    $ kubectl describe pods
    Name:             nginx
    Namespace:        default
    Priority:         0
    ... (much more information)

These tools exist for all Kubernetes resources.
For example, check the output of `kubectl get nodes`.

## Interact with a Pod

The Kubernetes CLI offers basic commands that are very similar to Docker functionality.
For example, you can open a port-forward to access the exposed ports of a container.
`nginx` is running on port 80, so the following command will make it accessible on [localhost:1234](http://localhost:1234).

    $ kubectl port-forward nginx 1234:80

The forward can be interrupted with `Ctrl+C`.
Similar to Docker, it is also possible to see the logs by naming the container:

    $ kubctl logs nginx
    # add -f for a continuous log
    $ kubctl logs -f nginx

Finally, you can use the `exec` command to connect to a running container, for example, to start a shell and inspect the container from the inside.
The `-it` parameter is required for an interactive terminal.

    $ kubectl exec -it nginx -- bash

The functions are easy to remember, as they work very similar to their Docker equivalents, however, it is even more convenient to access the functionality in the Minikube dashboard.

Open the Dashboard, navigate to *Pods* and select the `nginx` pod.
In the top right corner, you will find buttons for reading the logs, `exec` into the container, editing the resource details, or deleting the pod.


## Free the Resources

To finish this exercise, remove the resources from the cluster again.

    $ kubectl delete -f simple-pod.yml

Applying and deleting files is very convenient and, *most of the time*, files can just be re-applied and Kubernetes will just update the configuation.
However, only those resources will be updated/deleted that are still included in the file.
After major changes or renaming of resources, Kubernetes might not be able to map the resources in the file to resources that are still deployed in the cluster.

In such a case, you might be forced to delete the old resources manually.
For example, a manual removal of a pod called `nginx` can be achieved by running `kubectl delete pod nginx`.
The `delete` command supports all resource types.

