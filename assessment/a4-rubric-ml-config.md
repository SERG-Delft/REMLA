---
layout: page
title: ML Configuration Management
parent: Assessment
---

# {{page.title}}

The following rubrics will be assessed on a scale from *Insufficient* to *Excellent*.

### Project best practices

Sufficient
: The project is converted into a python project with different scripts that map to the different stages of the AI pipeline. The project is structured in a way that follows recommendations (e.g., cookiecutter). The library dependencies are specified and use an adequate package manager. There are clear instructions on how to run the pipeline.

Good
: The project is converted into a python project with different scripts that map to the different stages of the AI pipeline. The project is structured in a way that follows recommendations. The library dependencies are specified and use an adequate package manager that guarantees that the exact same dependencies are installed in different machines. The dataset is stored outside the project and can be automatically downloaded as part of the pipeline. The dataset is stored remotely. There are clear instructions on how to run the pipeline.

Very good
: The project is converted into a python project with different scripts that map to the different stages of the AI pipeline. The project is structured in a way that follows recommendations, looks clean and well organised. The library dependencies are specified and use an adequate package manager that guarantees that the exact same dependencies are installed in different machines. The dataset is stored outside the project and can be automatically downloaded as part of the pipeline. The dataset is stored remotely. There are clear instructions on how to run the pipeline. All decisions are properly documented and reveal a critical understanding. Mllint is used to assess these practices and is part of the continuous integration pipeline. Exploratory code appears only in Jupyter notebooks. Unnecessary code and artefacts are not part of the project python source.

Excellent
: The project is converted into a python project with different scripts that map to the different stages of the AI pipeline. The project is structured in a way that follows recommendations and looks clean and well-organised. The library dependencies are specified and use an adequate package manager that guarantees that the exact same dependencies are installed in different machines. The dataset is stored outside the project and can be automatically downloaded as part of the pipeline. The dataset is stored remotely. There are clear instructions on how to run the pipeline. All decisions are properly documented, supported by related work, and reveal a critical understanding of the theory. Mllint does not report issues and all its recommendations are implemented. Mllint reports are included in the PRs.


### Pipeline Management

Sufficient
: All the different stages of the pipeline can be run using `dvc repro`. Dependencies and outputs are well-defined. Metrics are generated to an output file.

Good
: All the different stages of the pipeline can be run using `dvc repro`. Dependencies and outputs are well-defined. There is a remote storage configured. DVC is used to report metrics and to keep track of different experiments/models.

Very Good
: All the different stages of the pipeline can be run using `dvc repro`. Dependencies and outputs are well-defined. There is a remote storage configured. DVC is used to report metrics and to keep track of different experiments/models. Different metrics are reported.

Excellent
: All the different stages of the pipeline can be run using `dvc repro`. Dependencies and outputs are well-defined. variable. There is a remote storage configured with instructions on how to set it up. DVC is used to report metrics and to keep track of different experiments/models. It is possible to display metrics across multiple branches and tags. Different metrics are reported beyond model correctness.


### Code Quality

Sufficient
: The project follows code quality best practices, which can be assessed in the continuous integration pipeline. It uses pylint and it has been properly configured. Running pylint yields a successful output. Dslinter is also configured.

Good
: The project follows code quality best practices, which can be assessed in the continuous integration pipeline. Pylint and DSLinter yield a perfect score and were properly configured.

Very Good
: The project follows code quality best practices, which can be assessed in the continuous integration pipeline and when a pull request is submitted. Pylint and DSLinter yield a perfect score and were properly configured. They are part of the continuous integration pipeline. Configuration decisions follow ML conventions and are properly motivated. 

Excellent
: The project follows code quality best practices, which can be assessed in the continuous integration pipeline and when a pull request is submitted. Pylint and DSLinter yield a perfect score and were properly configured. They are part of the continuous integration pipeline. Configuration decisions follow ML conventions and are properly motivated. The project implements different ways to display code quality information, considers multiple linters, critically analyses linter rules, and proposes new missing ML rules.


The peer review will also contain a free text form.
Please use this form to summarise your assessment of all rubric criteria in this category, especially if you rated something as insufficient.
In addition, explain what you think would be the next important step that needs to be realised.