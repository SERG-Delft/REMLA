---
layout: page
title: Install Prometheus
parent: Monitoring
grand_parent: Material
nav_order: 2
---

# {{page.title}}

In this exercise, we will install the full Prometheus stack to a Kubernetes cluster, so we can use it for monitoring applications.

## Add Prometheus Repository

As a first step, visit the [Artifact Hub][helm-hub].
You can easier browse all packages or you can search for `kube-prometheus-stack`.
In both cases, the top result should be the [kube-prometheus-stack][helm-promstack] package, which is the most popular Helm chart in the whole repository.

Open the package and read the install instructions.
Run the following commands to install the Prometheus stack in your cluster.

[helm-hub]: https://artifacthub.io/
[helm-promstack]: https://artifacthub.io/packages/helm/prometheus-community/kube-prometheus-stack


    $ helm repo add prom-repo https://prometheus-community.github.io/helm-charts
    "prom-repo" has been added to your repositories
    $ helm repo update
    Hang tight while we grab the latest from your chart repositories...
    ...Successfully got an update from the "prom-repo" chart repository
    Update Complete. ⎈Happy Helming!⎈

The repository now shows up as a registered repository for Helm charts.

    $ helm repo list
    NAME       URL
    prom-repo  https://prometheus-community.github.io/helm-charts

You can run `helm repo remove prom-repo` should you ever wish to remove it again.



## Install Prometheus Stack

Installing the full Kubernetes stack in your cluster is as simple as running one command.
The command might take several seconds to complete, as multiple container images need to be downloaded in the background.

    $ helm install myprom prom-repo/kube-prometheus-stack
    ...
    kube-prometheus-stack has been installed. Check its status by running:
      kubectl --namespace default get pods -l "release=myprom"

The output contains an important bit of information: the Prometheus instance is labeled with `release=myprom` this will become important later for the service discovery.

Once the command has completed, you will find several new pods...

    $ kubectl get pods
    NAME                                                     READY   STATUS    RESTARTS      AGE
    alertmanager-myprom-kube-prometheus-sta-alertmanager-0   2/2     Running   1 (71s ago)   82s
    myprom-grafana-85b4df954d-zjdx9                          3/3     Running   0             94s
    myprom-kube-prometheus-sta-operator-99569497f-9pdht      1/1     Running   0             94s
    myprom-kube-state-metrics-76648c695d-c92f6               1/1     Running   0             94s
    myprom-prometheus-node-exporter-nqqs8                    1/1     Running   0             94s
    prometheus-myprom-kube-prometheus-sta-prometheus-0       2/2     Running   0             81s

...  and services in your cluster.

    $ kubectl get services
    NAME                                     TYPE       CLUSTER-IP      EXTERNAL-IP  PORT(S)    AGE
    myprom-grafana                           ClusterIP  10.97.185.203   <none>       80/TCP     2m23s
    myprom-kube-prometheus-sta-alertmanager  ClusterIP  10.106.166.85   <none>       9093/TCP   2m23s
    myprom-kube-prometheus-sta-operator      ClusterIP  10.99.77.119    <none>       443/TCP    2m23s
    myprom-kube-prometheus-sta-prometheus    ClusterIP  10.109.5.218    <none>       9090/TCP   2m23s
    myprom-kube-state-metrics                ClusterIP  10.104.2.195    <none>       8080/TCP   2m23s
    myprom-prometheus-node-exporter          ClusterIP  10.109.205.170  <none>       9100/TCP   2m23s
    prometheus-operated                      ClusterIP  None            <none>       9090/TCP   2m10s

By default, Prometheus does not have an *Ingress*, so we need to use a port-forward again to access its website.
We are interested in the `myprom-kube-prometheus-sta-prometheus` service that runs on port 9090.
Run and the following command and keep the terminal open for the rest of the exercise.
Also remember the command, as you will need access to the service again in a later exercise.

    $ minikube service myprom-kube-prometheus-sta-prometheus --url

Copy the URL and open it in a browser.
You have completed this exercise when you see a website and can open, for example, the *Status* of the Prometheus *Targets* from the menu.





