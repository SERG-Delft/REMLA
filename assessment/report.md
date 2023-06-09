---
layout: page
title: Report
parent: Assessment
---

# {{page.title}}


## Pass/Fail

The following criteria will be assessed as *pass*/*fail*.

- The report follows the formatting guidelines.
- The report follows the expected structure.
- The report contains elaborated text and balances the content between the different parts.
- The language quality is high and it is easy to read and follow the report.


## Graded Components

The following criteria will be assessed on a scale from *Insufficient* to *Excellent*.


### Pipelines\*

Insufficient
: At least one of the pipelines (model training and release) is not documented.

Sufficient
: The two pipelines of your project (model training and release) are described and all pipeline steps get introduced.

Good
: The report describes the purpose of all pipeline steps and introduces the relevant tools.
The documentation visualizes the pipelines and connects the text.

Very Good
: The documentation introduces relevant artifacts/data and their dependencies/flow.

Excellent
: The documentation makes it easy for new team members to get started with contributing to the project.
It becomes easy to understand the build pipelines, i.e, how models and releases are built and where artifacts get published.

{:.footnote}
(\*) This rubric focuses on the documentation and does *not* assess whether the pipelines makes sense.


### Deployment\*\*

Insufficient
: The deployment documentation is incomprehensible or incomplete.

Sufficient
: The deployment documentation is limited to the structure of the deployment (the entities and their connections) *or* the data flow for incoming requests.
The documentation visualizes the deployment and connects the text.

Good
: The deployment documentation describes both the structure of the deployment (the entities and their connections) *and* the data flow for incoming requests.

Very Good
: The deployment documentation includes all deployed resource types and relations.

Excellent
: The deployment documentation is visually appealing and clear.
It is easy for a new team member to understand and to start contributing to the described system.

{:.footnote}
(\*\*) This rubric covers all visualizations in the *Deployment*, *Experimental Setup*, and *Additional Use Case* sections.


### Related Work

Insufficient
: Many parts of the report are not backed by references to trustworthy sources.\*\*\*

Sufficient
: Some parts of the report lack references to trustworthy sources.

Good
: All parts of the reports are backed by a references to trustworthy sources.
The report has 10+ references.

Very Good
: Most references do not just link to documentation or code examples, but to material that discusses a problem and the benefits/drawbacks/limitations/... of a solution.

Excellent
: Several of the references can be recommended as an interesting read to new DevOps engineers.
The linked resources provide inspiration for release engineering tasks and provide a learning opportunity to the reader.

{:.footnote}
(\*\*\*) We consider *scientific papers* and gray literature on respectable sources (e.g., quality blogs like *Medium*; tool websites; or popular *StackOverflow* discussions) as acceptable sources for references.


### Configuration Management

Sufficient
: The configuration management of the AI pipeline is explained in a way that can be understood by stakeholders with a common understanding of release engineering and AI engineering concepts. There is a visual overview that helps understand the pipeline. The main decisions are documented and there is a discussion of opportunities or lessons learned.

Good
: The configuration management of the AI pipeline is explained in a way that can be understood by stakeholders with a common understanding of release engineering and AI engineering concepts. There is a visual overview that helps understand the pipeline.
Other visual diagrams are used to complement text and bring clarity to some of the design choices. Most key aspects of the configuration management process are addressed, including version control, dependency management, code standards, or deployment strategies.
There is a clear explanation of the decisions made, although some details may be lacking. The impact of these decisions on the project is discussed, although it could be further elaborated. There is some discussion of limitations, opportunities, and lessons learned, but it could be more comprehensive and reflective.

Very Good
: The configuration management of the AI pipeline is explained in a way that can be understood by stakeholders with a common understanding of release engineering and AI engineering concepts. There is a visual overview that helps understand the pipeline. Other visual diagrams are used to complement text and bring clarity to some of the design choices. All key aspects of the configuration management process are addressed, such as version control, dependency management, code standards, or deployment strategies. There is a clear explanation of the decisions made and a discussion of their impact in the project. There is a thorough discussion of limitations, opportunities and lessons learned.


Excellent
: The configuration management of the AI pipeline is explained in a way that can be understood by stakeholders with a common understanding of software engineering concepts. There is a visual overview that helps understand the pipeline. Other visual diagrams are used to complement text and bring clarity to some of the design choices. All key aspects of the configuration management process are addressed, such as version control, dependency management, code standards, or deployment strategies. There is a clear explanation of the decisions made and a discussion of their impact in the project. There is a thorough discussion of limitations, opportunities and lessons learned. There is a critical reflection on the current status of the project and alternative technologies are considered. Decisions, discussion, take-aways, are backed up with existing related work. 


### Testing Design

Sufficient
: The testing design is explained in a way that can be understood by stakeholders with a common understanding of release engineering and AI engineering concepts. There is a visual overview that helps understand the testing strategy. The different types of tests that were implemented in the project are clearly described. The main decisions are documented and there is a discussion of opportunities or lessons learned.

Good
: 
The testing design is explained in a way that can be understood by stakeholders with a common understanding of
release engineering and AI engineering concepts. The explanation is logical, coherent, and it is easy to follow.
There is a visual overview that helps understand the testing strategy. Other visual diagrams are used to complement
text and bring clarity to some of the design choices. The different types of tests implemented in the project are
adequately described, providing a good overview of the testing process. While there is a discussion of limitations,
opportunities, and lessons learned, it could be more comprehensive and reflective. Some preliminary results are
presented, although more detailed and conclusive findings would enhance the evaluation.


Very Good
: The testing design is explained in a way that can be understood by stakeholders with a common understanding of release engineering and AI engineering concepts. The explanation is logical, coherent, and easy to follow. There is a visual overview that helps understand the testing strategy. Other visual diagrams are used to complement text and bring clarity to some of the design choices. The different types of tests that were implemented in the project are clearly described and motivated. All the details and decisions made are clearly documented and a discussion of their impact in the project. The section shows some preliminary results and there is a discussion of limitations, opportunities and lessons learned.


Excellent
: 
The testing design is explained in a way that can be understood by stakeholders with a common understanding of software engineering concepts. The explanation is logical, coherent, and easy to follow. There is a visual overview that helps understand the testing strategy. Other visual diagrams are used to complement text and bring clarity to some of the design choices. The different types of tests that were implemented in the project are clearly described and motivated. All the details and decisions made are clearly documented and a discussion of their impact in the project. The section shows some preliminary results and there is a discussion of limitations, opportunities and lessons learned. There is a critical reflection on the current status of the project and alternative technologies are considered. Decisions, discussion, take-aways, are backed up with existing related work.  


### Extension Proposal

Insufficient
: The extension is unrelated to the release engineering practices and focuses on an implementation aspect.
The extension is trivial or irrelevant for the current project.

Sufficient
: The report describes a meaningful extension to either the training pipeline, release pipeline, contribution process, or deployment.
It *does not have to* cover more than one.

Good
: The report contains a critical reflection on the existing design and provides a convincing argumentation of a current shortcoming and its negative effect.

Very Good
: The presented solution is clearly addressing the described shortcoming.
The report also includes a brief explanation of how the success could be measured objectively.

Excellent
: The presented extension is general in nature.
It is relevant and applicable beyond the context of the concrete project.


