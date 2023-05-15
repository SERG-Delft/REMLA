---
layout: page
title: Use Prometheus
parent: Monitoring
grand_parent: Material
nav_order: 3
---

# {{page.title}}

In this exercise, we will deploy an instance of the [proksch/showmetrics][showmetrics-image] image to the cluster.
You can inspect the [source code of showmetrics][showmetrics-source] to better understand its trivial implementation.

[showmetrics-image]: https://hub.docker.com/repository/docker/proksch/showmetrics/
[showmetrics-source]: https://github.com/proksch/showmetrics



## Deploy a Service for Monitoring

Create a new file `monitoring.yml` somewhere in your file system.
We will deploy a *Pod* of the `showmetrics` image that has been discussed in the lecture.
A service will be added to make the app discoverable.

```yml
# monitoring.yml
apiVersion: v1
kind: Pod
metadata:
  name: showmetrics
  labels:
    app: showmetrics
spec:
  containers:
  - name: showmetrics
    image: proksch/showmetrics:latest
    ports:
    - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: my-service
  labels:
    app: showmetrics-serv
spec:
  type: NodePort
  selector:
    app: showmetrics
  ports:
    - port: 1234
      targetPort: 8080
```

Add the following *ServiceMonitor* resource for enabling the service discovery feature of Prometheus.

```yml
...
---
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: mymonitor
  labels:
    release: myprom
spec:
  selector:
    matchLabels:
      app: showmetrics-serv
  endpoints:
  - interval: 1s
```

Please note a couple of things in these resource configurations:

- A `ServiceMonitor` is not a core type of Kubernetes and provided as an extension.
It does not show up as nicely as the built-in resources in, for example, the dashboard, nor is the documentation on par with the official Kubernetes documentation.
- Find the label definitions in the three resources and find their matchers.
Please note that only the ServiceMonitor needs to be discovered by Prometheus via the `release` label, the other labels are used to find the *Pod* and *Service*.
- A poll interval of 1s is *very* short and only used to make it easier to see changes in the short timeframe of the exercise.
In production, the value should be (much) higher, the challenge is to find a timeframe that makes sense.
- A ServiceMonitor spec can define the `targetPort` (which must then point to the port of the *Pod*/*Deployment*, not to the *Service* port) and the `path` (which defaults to `/metrics`).
Both are optional and the default values work in most cases.

Apply `monitoring.yml` to your cluster.
Make sure that the service is running and run the following command to create a port-forward to the service, keep this command running.

    $ kubectl apply -f monitoring.yml
    $ minikube service my-service --url

Explore the two trivial pages of the app and reload each page a couple of times.
Now visit the `/metrics` endpoint, you should see the metrics `my_random`, `num_requests`, and `index_relevance`.

Create a port-forward again to expose the Prometheus backend if you did not keep it running from the previous exercise.

    $ minikube service myprom-kube-prometheus-sta-prometheus --url

When you access the dashboard, `my-service` should show up as a monitoring target (Status » Targets).


## Query the Collected Metrics with PromQL 

As the metric collection is working now, we can start looking into querying the metrics.
For this, open the Prometheus service and access the *Graph* item in the menu.
Switch the view from *Table* to *Graph*.

Enter one of the metrics as a query (e.g., `my_random`) and make yourself familiar with the interactions of the graph view, e.g., zoom in or out to change the timeframe that you are looking at.
It is recommended to have the webapp running in a separate browser window and interact with it every not and then to see changes in the metrics.

You can look at several basic examples of PromQL:

- `num_requests` This is the number of requests to the web application.
Realize that there are two different curves, which have different `page` labels.
- `num_requests{page="index"}` You can filter the result using one or more labels.
In this case, you only see the requests for the `index` page.
- `sum(num_requests)` As an alternative, you can just add the different labels together.
- `rate(num_requests[10s])` A counter is monotonous and can only increase.
By providing a timeframe (e.g., `[10s]`), the data points are convered into a range vector.
While such a range vector cannot be directly plotted, utility function exist to interpret the contents.
For example, the `rate` function will plot the request rate within the timeframe.

Another set of interesting examples to look at comes from the random gauge.

- `my_random` By default, the guage is just wildly jumping between 0 and 1.
- `avg_over_time(my_random[5s])` Gauges can be accessed via a timeframe and then need an aggregator function for the range vector.
In this example, `avg_over_time` shows the average.
Even within a 5s window, the average over all random numbers is much more stable already.
- `avg_over_time(my_random[60s])` If you increase the timeframe even more, the variance in the average becomes smaller and smaller (please note that the axis changes!).
If the window is large enough, the average should converge towards 0.5 for every serious random number generator.

A second example of a gauge is the `index_relevance`, which indicates the percentage of requests that land on the index page.

- `index_relevance` This metric is easier to inspect than `my_random` as it actually follows your usage of the service.
- `deriv(index_relevance[5s])` Instead of looking at the absolute numbers, it is possible to derive the change of the number over a timeframe.
This makes it much easier to spot and quantify changes.








