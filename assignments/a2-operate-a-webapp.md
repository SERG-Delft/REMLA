---
layout: page
title: "A2: Operate a Webapp"
parent: Assignments
---

# {{ page.title }}

In this assignment, you will migrate your project to Kubernetes and enabling monitoring.
The assignment is a continuation of A1, you do not have to create new repositories, instead, extend and evolve the existing files, repositories, and build pipelines.


## Extend Webapp

In the last assignment, you were asked to create a basic `app` that connects to the `model-service`.
This course is not a development class, so we do not expect you to create a sophisticated webapp or drive it to perfection.
However, we expect that in the end, the webapp will end up in a usable state and should implement a basic use case that integrates and enables the different parts of this course.
What exactly you want to do with your webapp is up to you though.

The more you learn about the project and the tighter all components get integrated, the more you can polish your webapp.
Invest a bit of time in every assignment to improve the different aspects (e.g., architecture, layout, coding, ...).


## Create a Kubernetes Setup

In the last assignment, you were asked to create a Docker compose configuration that can be used to instantiate the whole deployment.
For this exercise, we want you to migrate the deployment to Kubernetes.
You can take inspiration from the [SMS Spam example][sms-example] that has been introduced in the Kubernetes exercise.

At the bare minimum, we expect the declaration of a *Deployment*, a *Service*, and an *Ingress*, but the more you can illustrate that you know how to make use of the different resource types that have been intoduced in the lecture, the better.

Excellent groups will provide a Helm chart for the complete deployment that can be installed more than once into the same cluster.
If you use sensitive information in your deployment files (e.g., SMTP passwords), you should find a solution to keep them out of the public repository and make them exchangable (e.g., by using variables).


[sms-example]: {%link material/kubernetes/migrate-docker-compose.md%}


## Enable Monitoring in your Application

The monitoring lecture has introduced Prometheus as a powerful solution to modern monitoring needs.
We want you to enable Prometheus in your deployment using a *ServiceMonitor*.

Introduce domain-specific metrics in your webapp.
Define at least three metrics that are specific to your concrete webapp.
They need to allow you to reason about how your users are using the system or how your model predictions are perceived by the user.
A simple example would be the accuracy of your trained model over time.

{:.info}
You might need to introduce additional interactions in your webapp that can be instrumented to create monitorable events.
For example, for the model accuracy, you would need to find a way to get the "correct" answer from the user or to validate your prediction.

At the very basic level, you need to introduce a *Gauge* metric and a *Counter* metric, however, good groups will also use of *Histograms* and *Summaries* and will break down the metrics with *Labels*.

Excellent groups will provide [alerting capabilities][alerting]. They will configure the *AlertManager* in Prometheus and define at least one *PrometheusRule* that can warn developers through a channel of your choice (e.g., email).
The rule does not need to complex, for example, you could limit yourself to an alert when your service receives more than 15 requests per minute for two minutes straight.

{:.info}
Do not put passwords into your public deployment files!

[alerting]: https://prometheus.io/docs/alerting/latest/overview/

## Grafana

Create a Grafana dashboard that shows your custom metrics.
The dashboard allows to import/export JSON files to share a dashboard.
At the basic level, you will put these JSON files into the `operations` repository and explain in the `README.md` how they can be manually installed.

Good groups will create an advanced dashboard that uses several different visualizations to illustrate that they have understoof the details of Grafana.
Use visualizations for *Gauges* and *Counters*, use timeframe selectors, and apply functions like *rate* or *avg* to create interesting plots.

Excellent groups will make a manual import of the dashboars unnecessary by  including the files in a *ConfigMap* that is provided to the Grafana deployment.
The goal is that the additional dashboards will be automatically provided when your webapp is installed.
You can take inspiration from the Grafana templates that are automatically added by the [`prometheus-operator` chart][prom-op].

[prom-op]: https://github.com/helm/charts/tree/master/stable/prometheus-operator/templates/grafana





## Deploy to a Public Cloud (Optional)

Our course has received sponsoring from Google in the form of [Google Cloud][gcloud] credits.
We do not require you to use the Google cloud, but we challenge you to deploy your application to the cloud.
It will surely be an exhilarating exercise for you when you experience for the first time how it feels to use `kubectl` with an *actual live system*!
You can claim your credits through a link on Brightspace.

*Disclaimer:* We do not provide any support or further instructions on how to use the Google systems.
The available documentation of these systems is vast, but you are on your own here.



[gcloud]: https://cloud.google.com/


## Submission

The assignment follows the process that has been laid out in the general description of the [peer review][peer-review] process.
Please prepare the submission document that contains links to everything.

The deadline for the assignment is Mon, May 15, 23:59pm.
After the submission, you are supposed to review your own submission and that of another group.
The deadline for these reviews is Mon, May 22, 23:59pm.

The following rubrics are relevant for the assignment:

- [Basic Requirements]({%link assessment/basic-requirements.md%})
- [Kubernetes & Monitoring]({%link assessment/kubernetes-and-monitoring.md%})



[peer-review]: {%link assignments/peer-review.md%}



