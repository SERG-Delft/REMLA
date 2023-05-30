---
layout: page
title: Kubernetes & Monitoring
parent: Assessment
---

# {{page.title}}

The following criteria will be assessed on a scale from *Insufficient* to *Excellent*.


### Extend Webapp

This rubric assumes that you have extended your application with monitorable events, i.e., additional interactions in the webapp need to be created and instrumented.
These criteria have already been covered in the [Containers & Orchestration][rub-cnc] rubric and are not repeated here to avoid duplication.
Make sure that you do not forget about these criteria when building your own application!


[rub-cnc]: {%link assessment/containers-and-orchestration.md%}#app

### Kubernetes Setup


Sufficient
: The application can be deployed to a Kubernetes cluster.
The relevant deployment files contain *at least* a *Deployment*, a *Service*, and an *Ingress*.
The app is accessed through the *IngressController*, i.e., it is not required to open a node port or to tunnel a service.

Good
: A good setup contains examples of the additional resource types *ConfigMap* and *Secret* and it defines environment variables and volumes in a *Deployment*.

Very Good
: Better than "good", but not all criteria of "excellent" are fulfilled.

Excellent
: A Helm chart exists that covers the complete deployment.
The Helm chart can be installed more than once into the same cluster.
The deployment files must not contain sensitive information (e.g., SMTP passwords).



### App Monitoring


Sufficient
: The app collects at least three app-specific metrics that allow you to reason about users behavior or model performance.
These metrics include a *Gauge* and a *Counter*.

Good
: Additional metrics are introduced of type *Histogram* and *Summary*.
All four metrics types have at least one example, in which the metric is broken down with Labels.


Very Good
: Better than "good", but not all criteria of "excellent" are fulfilled.

Excellent
: A Prometheus *AlertManager* is configured and at least one non-trivial *PrometheusRule*, i.e., an alert is raised, when the service receives more than 15 requests per minute for two minutes straight.
*Alerts* are raised in a channel of your choice (e.g., email).


### Grafana


Sufficient
: The project contains a JSON definition of a basic Grafana dashboard that can be imported to show the app-specific metrics.
The operations repository contains a `README.md` that explains the manual installation.


Good
: The dashboard is more advanced and contains a selection of visualizations, i.e., specific visualizations for Gauges and Counters, it uses timeframe selectors in the queries, and it applies functions (like `rate` or `avg`) to create interesting plots.

Very Good
: Better than "good", but not all criteria of "excellent" are fulfilled.

Excellent
: The dashboard will be automatically installed by Helm and a manual import of the exported JSON files is unnecessary.

