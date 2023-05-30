---
layout: page
title: "A6: Report"
parent: Assignments
---

# {{ page.title }}

{:.caution}
This page is not yet finalized


In this assignment, you will create a documentation of your project that covers all aspects of the lectures.
This document will be one of the essential deliverables that will be graded in the end.

*Important:* It is not expected that the essay includes sources or .yml files.
It should focus on the conceptual aspects and should link to the repository, when references are needed.


## Format


The essay must follow the ACM formatting template ([GitHub](https://github.com/proksch/template-report), [Overleaf](https://www.overleaf.com/read/zsdrgrzgncnb)), no change in the formatting is allowed (font size, line height, margins, etc.).
You are free, however, to adapt the document structure.

We recommend to mimic the following structure in the essay, most importantly, you can remove abstract and introduction from the template.
The created essay must contain at least XXX words, which should roughly translate to XXX pages in the given format.


{:.info}
The intent of the guidelines is to create comparable results.
We will check the formatting guidelines strictly and fail submissions that ignore them.

## Expected Structure



#### Pipelines

Document the two pipelines of your project (*model training* and *release*).
The pipeline documentation should introduce the different pipeline steps (incl. tools), elaborate their purpose, and illustrate the relevant artifacts/data and their dataflow throughout the steps.
A new team member should be able to understand how your models and releases are built and where the different artifacts get published.

{:.info}
A visual representation will prove useful in most cases.


#### Deployment

Document the deployment of your final application.
The visualization should cover both the structure of the deployment (the entities and their connections), but also the data flow for incoming requests.
You can take inspiration from the [Kiali dashboard][istio-exercise], but your visualization should include *all* resources that you have deployed in the cluster and their connections.


[istio-exercise]: {%link material/continuous-experimentation/custom-routing.md%}




#### Experimental Setup

As part of the [Istio assignment][assignment-istio], you were asked to design an experiment for a future version of your application.
If you have done the extension, it should be documented in the essay.
The essay should contain a section on the *experimental setup* and describe each of the following parts in depth:

- General description of the experiment.
- The changes compared to the *base design* in the *Deployment* section.
- The hypothesis that is tested in the experiment.
- The relevant metrics, i.e., *what* is being measured and *how* this is achieved.
- A description of the decision process.
More concretely, which data will be available (e.g., a Grafana screenshot) and how it will be used to derive a decision/answer regarding the hypothesis.


[assignment-istio]: {%link assignments/a3-istio-service-mesh.md%}

#### Additional Use Case

As part of the [Istio assignment][assignment-istio], you were asked to adopt an addition Istio use case in your application.
If you have implemented one, it should be documented in the essay.
The essay should contain a section on the *additional use case* and describe each of the following parts in depth:

- General description of the use case.
- The changes compared to the *base design* in the *Deployment* section.

#### Configuration Management

{:.caution}
TODO

Document ML configuration management decisions


#### Testing Design

{:.caution}
TODO

Document ML testing design and decisions.


#### Extension Proposal

Imagine that you are the maintainer of the project.
Envision the next extension that you would implement to further improve the release engineering and/or ML development processes.

The goal of this exercise is manifold.
Most importantly, we want to see that you can critically reflect on the current state of the project and identify the point that *you* find the most critical/annoying/error prone.
Equipped with the knowledge of the course, 

- Describe the current shortcoming and its effect.
A convincing argumentation is crucial.
- Describe and visualize a pipeline refactoring/extension that improves the situation.
- Link to information sources that provide useful information about the problem, inspiration for your solution, or concrete examples for its realization.
We expect that you cite respectable sources (e.g., quality blogs like Medium; tool websites; or popular StackOverflow discussions).
- Describe how you could test whether the changed design would solve the original shortcoming.




## Submission

The assignment follows the process that has been laid out in the general description of the [peer review][peer-review] process.
Please prepare the submission document that contains links to everything.

The deadline for the assignment is Mon, Jun 12, 23:59pm.
After the submission, you are supposed to review your own submission and that of another group.
The deadline for these reviews is Mon, Jun 19, 23:59pm.

The following rubrics are relevant for the assignment:

- [Basic Requirements]({%link assessment/basic-requirements.md%})
- [Essay]({%link assessment/essay.md%})
- [Istio Service Mesh]({%link assessment/istio-service-mesh.md%}) (See *"Continuous Experimentation"* and *"Additional Use Case"*)


[peer-review]: {%link assignments/peer-review.md%}
