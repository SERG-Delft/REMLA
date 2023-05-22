---
layout: page
title: Istio Service Mesh
parent: Assessment
---

# {{page.title}}

The following rubrics will be assessed on a scale from *Insufficient* to *Excellent*.
All partial solutions must be achieved through leveraging Istio functionality.


### Traffic Management

Sufficient
: System defines a *Gateway* and *VirtualServices*.
The application is accessible through the *IngressGateway* (i.e., `minikube tunnel`).

Good
: The project resembles the state of the in-class exercise and uses *DestinationRules* and weights to enable a custom routing of services.

Excellent
: The custom routing is not random.
Repeated requests from the same origin have a stable routing (e.g., through header information or identifying specific user tokens).

### Continuous Experimentation

Insufficient
: No app-specific Prometheus metrics are scraped.

Sufficient
: App-specific Prometheus metrics get scraped from the deployments.

Good
: System deploys two versions and is prepared for a concrete experiment, which will be able to show whether the newer version is acceptable.

Excellent
: The essay\* contains a section that describes the experiment. It documents what has been changed, the hypothesis, the relevant metrics, and the decision process, incl. the available data that supports the decision.

{:.footnote}
(\*) For the formative feedback, the description can simply be placed in the repository or linked as a web-document.


### Additional Use Case

Insufficient
: Either no additional use case has been realized or its task complexity does not compare to the given examples.

Sufficient
: One of the described use cases has been partially realized, but it falls short in some aspects.

Good
: One of the described use cases has been realized and it is fully working.

Excellent
: The working use case has been realized and apropriately documented in the essay\*.
The description elaborates the use case (necessity, benefits) and describes the solution in detail (diagrams, elaborations) so others can easily replicate it.

{:.footnote}
(\*) For the formative feedback, the description can simply be placed in the repository or linked as a web-document.
