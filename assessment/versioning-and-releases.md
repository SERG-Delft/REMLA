---
layout: page
title: Versioning & Releases
parent: Assessment
---

# {{page.title}}

The following rubrics will be assessed on a scale from *Insufficient* to *Excellent*.


### Releases/Versioning

Sufficient
: *All* artifacts (service *image*, app *image*, lib *package*) of the project are versioned and shared in package registries. The packaging and releases of all artifacts are performed in workflows.

Good
: All artifacts are automatically versioning in their release workflow that interpret the Git release tags as a version.

Very Good
: Better than "good", but not all criteria of "excellent" are fulfilled.

Excellent
: Patch versions are automatically increased in the process. Unfinished software is versioned with a label to avoid confusion with stable packages (e.g., `1.2.3-SNAPSHOT`).


### Library

Sufficient
: A version-aware\* library has been released to a package registry that makes it possible to reuse it in other (external) applications.

Good
: The version string is automatically updated with the actual package version in the release workflow, i.e., either it is directly taken from the project config, or it is taken from a file that is automatically generated.

Very Good
: Better than "good", but not all criteria of "excellent" are fulfilled.

Excellent
: The library contains meaningful data structures or logic that is used in both the training pipeline and in the model service.

{:.footnote}
(\*) In this context, version-aware means that the library contains a component that can be asked for its version, for example, to include it in log messages or data records.


### Reliable Model Creation

Sufficient
: The project has been refactored into a form that makes it possible to train the model in a replicable way.
The model has been built and is accessible through a public\* URL.

Good
: The project contains a `requirements.txt` file.

Very Good
: Better than "good", but not all criteria of "excellent" are fulfilled.

Excellent
: The different phases of the model creation have been identified, clearly separated, and can be executed conveniently through a script.

The peer review will also contain a free text form.
Please use this form to summarize your assessment of all rubric criteria in this category, especially if you rated something as insufficient.
In addition, explain what you think would be the next important step that needs to be realized.

{:.footnote}
(\*) It is acceptable when the URL requires authentication.
Just make sure that the peer reviewer/examiner has the required credentials, i.e., include them in your submission document.

