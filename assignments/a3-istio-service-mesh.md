---
layout: page
title: "A3: Istio Service Mesh"
parent: Assignments
---

# {{ page.title }}

In this assignment, you will extend your Kubernetes deployment by installing an Istio service mesh and using it for traffic management and continuous experimentation.
The assignment is a continuation of the previous assignments, so do not create new repositories, instead, extend and evolve the existing files, repositories, and build pipelines.


## Extend Webapp

As a continuing task that ranges over all assignments, extend your web app as you go along. For this week, you can think about a change that should be experimented on. In the last assignment, you have already introduced app-specific metrics, you could build a small extension that could be evaluated with these metrics. If your metrics do not fit your needs, feel free to introduce additional ones.

## Traffic Management

The in-class exercise has walked you through the necessary steps to configure Istio for gradual roll-outs.
Adopt this example in your project as well.
At the very basic level, you show that you can use Istio for your deployments and you use a *Gateway* and a *Virtual Service* to make your web app accessible through the *IngressGateway*. Good groups will replicate the complete example and will also use *DestinationRules* to realize a canary release to a small fraction of the users.

Excellent groups will extend the example and stablize the subset of requests, that are redirected to the new service, i.e., once selected, I would *only* see the new version.
If not, I would *only* see the old version.
This could be achieved by setting header information, such as flags or user tokens.


{:.footnote}
You do not have to implement a full CE system for organizing your experiments or partitioning your users. You can just *pretend* that it exists and set the information manually in your request headers or url parameters to illustrate the concept.

## Continuous Experimentation

Prepare your project for running an experiment.
At the very basic level that means that all infrastructure is configured and that Prometheus is able to collect app-specific metrics from your *Deployments*.
A good group would actually deploy two versions of a *Service* and collect app-specific metrics that can be used to decide whether the new version of the *Service* is acceptable.

Excellent groups introduce and document this experiment in the essay.
The description elaborates on what has been changed, the hypothesis, the relevant metrics, and the decision process.
Screenshots of a (Grafana) dashboard can be used to illustrate how the decision process is supported by data.

{:.footnote}
Ultimately, this documentation should end up in the essay.
For the formative feedback you can either add a document to your repositories or link a web-document in your submission.

## Additional Use Case

Istio is a rich tool and its features allow other uses that go beyond simple request routing.
The task is to use Istio to implement a second use case.
You can implement any of the following ideas or an idea of your own, when it is comparable in complexity.

Rate Limiting
: The service is automatically throttled for users that use it excessively.
For example, users that send more than 10 requests per minute get temporarily blocked.

Shadow Launch
: A second instance of the `model` service is deployed that has a newer version of the model.
The deployment will mirror existing traffic and submit it to both instances.
Custom metrics will make it possible to evaluate the new model version without exposing it to the users.

External Requests
: An *IngressGateway*/*VirtualService* makes it possible to abstract over internal service versions.
In a similar fashion, an *Egress* can be used to control external requests that leave the cluster.
Use such an *Egress* in your project.

Something Else
: You can implement any other use case of your liking with Istio.
The task complexity must be comparable to the other use cases though.

In addition to implementing the use case, you also need to document it appropriately:
introduce the use case and explain its necessity or benefits.
Clarify your implementation through diagrams and elaborate them in text.
Others should be able to replicate your solution from the document.

{:.footnote}
Ultimately, this documentation should end up in the essay.
For the formative feedback you can either add a document to your repositories or link a web-document in your submission.



## Submission

The assignment follows the process that has been laid out in the general description of the [peer review][peer-review] process.
Please prepare the submission document that contains links to everything.

The deadline for the assignment is Tue, May 30, 23:59pm.
After the submission, you are supposed to review your own submission and that of another group.
The deadline for these reviews is Mon, Jun 5, 23:59pm.

The following rubrics are relevant for the assignment:

- [Basic Requirements]({%link assessment/basic-requirements.md%})
- [Istio Service Mesh]({%link assessment/istio-service-mesh.md%})


[peer-review]: {%link assignments/peer-review.md%}



