---
layout: page
title: "A1: Images & Releases"
parent: Assignments
---

# {{ page.title }}

{:.info}
This assignment assumes that you are working with the [restaurant sentiment][project] dataset

[project]: {%link material/projects/restaurant-sentiment.md%}

## Basic Setup

- Create an open-source organization: `remla23-teamNN` (e.g., `remla23-team12`).
- Create the following repositories:
	- `model-training`
	- `model-service`
	- `lib`
	- `app`
	- `operation`
- Make sure that all repositories are public so your peers and examiners can access your results.
- The choice of the programming language is up to the group.
The only restriction is that the language must have a dedicated package registry on GitHub.

{:.info}
Public repository access is of utmost importance, so your peers and examiners have access.

## Tasks per Repository

#### model-training

Contains the ML training pipeline (will be used later in the course)

- For now, simply store all training related files here, more detailed requirements will follow later in the ML part of the course.
- Identify the set of requirements and create a `requirements.txt`.
- Identify the required steps to train a model. Put the trained model *somewhere*, so it can be integrated into the `model-service`.
- At this point, no automation is required for the model training.
- A major goal is to factor out the pre-processing and to make it reusable in the `model-service`.


#### model-service

Contains the wrapper service for the ML model.

- Fetch a trained ML model from *somewhere*.
- Embed the ML model in a Flask webservice, so it can be queried via REST.
- Use the same pre-processing for the data that was used for training.
- The webservice is containerized and released on GitHub through a workflow.
- The image is versioned automatically, e.g., through release tags.


#### lib

Contains a version-aware library, i.e., the library can be asked for its version, for example, to include it in log messages or data records.
The library may also contain other logic.

- Create a `VersionUtil` class that can be asked for its version.
- Release the library on GitHub in the package registry that matches the language.
- A workflow is used to release the library.
- The version is automatically updated by the workflow.


#### app

Contains a frontend web application that brings together all pieces.

- Depends on the `lib` through a package manager (e.g., `Maven`).
- Queries the `model-service` through REST requests.
- The URL of the `model-service` is configurable as an environment variable.
- The application contains a basic web frontend that represents a sensible usecase for the `model-service`.
For example, a textbox allows to enter a restaurant review.
When submitted (or dynamically *on change* via Javascript), a request is sent to the `app`, which in turn will delegate the request to the `model-service`.
The request initiates a sentiment analysis of the review.
Depending on the result, a *sad* or a *happy* smiley should be shown in the frontend.
- The app should be containerized and released automatically through a GitHub workflow.


#### operation

Contains all deployment files for Docker Compose & Kubernetes.
For now, only a Docker compose file is expected.

- The Docker compose file should make it trivial to run the application.
- The repository contains a `README.md`, which provides a concise documentation that includes...
	- An explanation on how to start the application (e.g., parameters, or requirements).
	- Some interesting starting pointers to files that help outsiders understand the code base.


## Submission

{:.info}
The following instructions have been updated.

The assignment follows the process that has been laid out in the general description of the [peer review][peer-review] process.
Please create the required organization and your repositories and prepare the submission document that contains links to everything.

After the initial setup problems, the deadline for the assignment has been extended to Fri, May 12, 23:59pm.
After the submission, you are supposed to review your own submission and that of another group.
The deadline for these reviews have been extended as well to Wednesday, May 17, 23:59pm.

The following rubrics are relevant for the assignment:

- [Basic Requirements]({%link assessment/basic-requirements.md%})
- [Versioning & Releases]({%link assessment/versioning-and-releases.md%})
- [Containers & Orchestration]({%link assessment/containers-and-orchestration.md%})



[peer-review]: {%link assignments/peer-review.md%}



