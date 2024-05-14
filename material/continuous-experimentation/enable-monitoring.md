---
layout: page
title: Enable Monitoring
parent: Continuous Experimentation
grand_parent: Material
nav_order: 4
---

# {{page.title}}

In this final part of the exercise, we will enable the monitoring of custom metrics through Prometheus.
Prometheus is built into Istio, however, the metric aggregation works slightly different than in a vanilla Prometheus installation.


## Register Metric Scraping

Istio will collect basic traffic metrics from all Istio proxies.
Open the Prometheus dashboard (`istioctl dashboard prometheur`) and inspect the *targets*.
You will see that the *kubernetes-pods* contain all deployed pods, including the different `app` and `lib` deployments.

When you go to the *Graph* section of the Prometheus dashboard and also switch to the *Graph* view, you will find that Prometheus collects a large number of metrics that are all called `istio_...` from the Istio proxies.
These metrics can alreday be used to understand the cluster traffic.

However, both `app` and `lib` expose the custom metric `num_requests` and this metrics is not scraped by Prometheus by default.
It is necessary to explicitly instruct Istio to also scrape these metrics from the containers.
This can be achieved by adding the following `prometheus.io` annotations to the four *Deployments* of `lib`/`app` and `v1`/`v2` and apply the changes to your cluster.

```yml
...
spec:
  template:
    metadata:
      annotations:
         prometheus.io/scrape: "true"
         prometheus.io/port: "8080"
...
```

Heading back to the Prometheus dashboard, the `num_requests` metric is available now in queries.


## Data Analysis

If you explore the collected datapoints, you will see that Prometheus attaches all Istio related labels.
This makes an unprocessed view of the `num_requests` metric very convoluted, because many lines are shown in the graph, but PromQL makes it trivial to aggregate and filter the data.

For example, the `sum by` command allows to group all datapoints by their respective `version` label and to sum up all values in each group.
The following example filters the deployed `lib` *Pods* and aggregates their values.

    sum by (version) (num_requests{app="lib"})

At this point, you can use and apply all the functions and techniques that you have learned in the In-class Exercise on Monitoring (See Brightspace).
Most importantly, PromQL queries can also be used in Grafana dashboards.

## Clean-up

This is the end of the exercise.
Delete all deployed resources from the cluster.
If you have not changed the `name` values, it should be possible to simply delete your `.yml` file from the cluster.

In the worst case, you should manually check for left-over *VirtualServices*, *DestinationRules*, or *Gateways*.


