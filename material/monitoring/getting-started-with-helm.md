---
layout: page
title: Getting Started with Helm
parent: Monitoring
grand_parent: Material
nav_order: 1
---

# {{page.title}}

In this exercise, you will take your first steps with [Helm][helm].
If you have not installed it yet, please [install Helm on your machine][helm-install].
Once installed, you should be able to run the `helm` command.

    $ helm version
    version.BuildInfo{Version:"v3.11.3", GitCommit:"...", GitTreeState:"clean", GoVersion:"go1.20.3"}

[helm]: https://helm.sh/
[helm-install]: https://helm.sh/docs/intro/install/
[helm-hub]: https://artifacthub.io/

## Install Wordpress

Helm uses the [Artifact Hub][helm-hub] as the built-in chart repository.
The website is searchable, search for `wordpress` and read the basic installation instructions.

To install Wordpress, run the following command.

    $ helm install wp1 oci://registry-1.docker.io/bitnamicharts/wordpress
    Pulled: registry-1.docker.io/bitnamicharts/wordpress:16.0.4
    Digest: sha256:e76dcaf9f200d21db6afb9708a40ae3cb5dff3174d63b4059919b3a71182a1e1
    NAME: wp1
    ...

After a successful execution, several instructions are printer to the terminal.
The most important instruction tells you how to find the admin password.

    echo Password: $(kubectl get secret --namespace default wp1-wordpress \
    	-o jsonpath="{.data.wordpress-password}" | base64 -d)

This will reveal the admin password for your `wp1` instance or wordpress.

To check details and the status of your release, you can use the `list` command.

    $ helm list -A
    NAME  NAMESPACE  REVISION  UPDATED              STATUS    CHART             APP VERSION
    wp1   default    1         2023-05-07 16:22:48  deployed  wordpress-16.0.4  6.2.0

You can also check the status of your cluster to see what has been deployed.

    $ $ kubectl get pods
    NAME                              READY   STATUS    RESTARTS      AGE
    wp1-mariadb-0                     1/1     Running   0             4m14s
    wp1-wordpress-cfc756bb4-2dhhm     1/1     Running   0             4m14s
    $ kubectl get services
    NAME             TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
    wp1-mariadb      ClusterIP      10.107.95.158    <none>        3306/TCP                     4m19s
    wp1-wordpress    LoadBalancer   10.100.26.173    <pending>     80:30364/TCP,443:32016/TCP   4m19s

So, apparently, the chart has installed a database and a webserver for the wordpress installation.
To access the service you could manually create an *Ingress*, but we will take a shortcut for this exercise and use `minikube` to automatically create such a tunnel for us.
Under the hood, the command will create a temporary *Ingress* for all configured *Services*.

    $ minikube service list
    |----------------------|------------------------------------|--------------|-----|
    |      NAMESPACE       |                NAME                | TARGET PORT  | URL |
    |----------------------|------------------------------------|--------------|-----|
    ...
    | default              | wp1-wordpress                      | http/80      |     |
    |                      |                                    | https/443    |     |
    ...
    |----------------------|------------------------------------|--------------|-----|
    $ minikube tunnel

Wordpress is configured for ports 80 and 443, as such, the tunnel command requires admin priviledges.
As long as the tunnel is up, you can then access [localhost](http://localhost/) or [localhost:443](http://localhost/) to access Wordpress.
The admin backend is reachable via [localhost/wp-admin](http://localhost/wp-admin), use the username `user` and the password that you have discovered before.

For this exercise, it is not relevant to understand how to use Wordpress.
The important learning is that Helm can be used to install complex deployments in your cluster with a single command.
It is even possible to run multiple releases of the same chart.

    $ helm install wp2 oci://registry-1.docker.io/bitnamicharts/wordpress
    ...
    $ helm list
    NAME  NAMESPACE  REVISION  UPDATED              STATUS    CHART             APP VERSION
    wp1   default    1         2023-05-07 16:22:48  deployed  wordpress-16.0.4  6.2.0
    wp2   default    1         2023-05-07 16:49:16  deployed  wordpress-16.0.4  6.2.0
    $ kubectl get pods
    NAME                             READY   STATUS    RESTARTS   AGE
    wp1-mariadb-0                    1/1     Running   0          23m
    wp1-wordpress-cfc756bb4-2dhhm    1/1     Running   0          23m
    wp2-mariadb-0                    0/1     Running   0          5s
    wp2-wordpress-7679687978-w8z5w   0/1     Running   0          5s

To finish this part of the exercise, uninstall your releases to free-up the resources again.

    $ helm uninstall wp1 wp2
    release "wp1" uninstalled
    release "wp2" uninstalled
    $ helm list
    NAME	NAMESPACE	REVISION	UPDATED	STATUS	CHART	APP VERSION


## Create Your First Chart

Similar to Docker *images*, it is not required to share *charts* in a repository, they can as well be defined and used locally.
To practice this, create a folder somewhere on your machine.
Within that folder, create the default template for a Helm chart.

    $ helm create my_chart
	Creating my_chart

Inspecting the folder will reveal the folder structure that has been discussed in the lecture.
For now, delete all content and reduce the folder to the following three files (create the `nginx.yaml` file).

    my_chart/
    ├── Chart.yaml
    ├── templates
    │   └── nginx.yaml
    └── values.yaml

For the exercise, you can leave the `Chart.yaml` file as is, but add the following contents to `values.yaml`.

```yml
# values.yml
nginx:
  version: latest
  port: 80
```

Also, add the following contents to `nginx.yaml`.
This is the same definition of a simple pod that we used in the Kubernetes lecture, but some parts are taken from variables.

```yml
# templates/nginx.yml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:{%raw%}{{{%endraw%}.Values.nginx.version}}
    ports:
    {%raw%}{{{%endraw%}- with .Values.nginx }}
    - containerPort: {%raw%}{{{%endraw%}.port}}
    {%raw%}{{{%endraw%}- end}}
```
The example illustrates two ways to access variables.
Either, by simply using the *full* path in the `values.yaml` (e.g., `{%raw%}{{{%endraw%}.Values.nginx.version}}`), or by binding the scope first (e.g., `{%raw%}{{{%endraw%}- with .Values.nginx }}`) and then only refering to a *relative* path (e.g., `{%raw%}{{{%endraw%}.port}}`).
You can find more information about values in the [Helm documentation on Values][helm-values].

[helm-values]: https://helm.sh/docs/chart_template_guide/values_files/

You can install this chart like every chart with the `install` command.
For the exercise, use the `--dry-run` and `--debug` flag to see the generated files, without directly applying them to your cluster.
You will see from the output that the variables have been replaced.

    $ helm install myrelease --dry-run --debug ./my_chart/
    ...
    # Source: my_chart/templates/nginx.yml
    apiVersion: v1
    kind: Pod
    metadata:
      name: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80

Default values can be overridden on install by using the `--set` parameter.
Run the following command to use a different version of `nginx`.

    $ helm install myrelease --dry-run --debug ./my_chart/ --set nginx.version=1.2.3
    ...
        image: nginx:1.2.3
    ...
