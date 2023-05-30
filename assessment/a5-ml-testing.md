---
layout: page
title: ML Testing
parent: Assessment
---

# {{page.title}}

This rubric enables assessment on a scale from *Insufficient* to *Excellent*.

### Testing Framework

Cut-off requirement:

- Ensure that a testing framework is set up in the project.
- Document the single command to run the tests clearly in the project's README or other relevant documentation.


### Automated Tests

Sufficient
: Test for non-determinism robustness.

Good
: Test for non-determinism robustness and use data slices to test model capabilities. There is at least one test for each of the following angle: Feature and Data; Model Development; ML infrastructure; Monitoring tests.

Very Good
: Test for non-determinism robustness and use data slices to test model capabilities. There is at least one test for each of the following angles: Feature and Data; Model Development; ML infrastructure; Monitoring tests. Non-functional requirements such as memory and performance are being tested. There is a test adequacy metric being reported. There is an implementation of mutamorphic testing.

Excellent
: Test for non-determinism robustness and use data slices to test model capabilities. There is at least one test for each of the following angle: Feature and Data; Model Development; ML infrastructure; Monitoring tests. The cost of features is being tested. Non-functional requirements such as memory and performance are being tested. There is an appropriate test adequacy metric being reported. There is an implementation of mutamorphic testing with automatic inconsistency repair.


### Continuous testing

Sufficient
: Tests are triggered through the continuous training pipeline.

Good
: Tests are triggered through the continuous training pipeline and test adequacy metrics are reported in the code repository.

Very Good
: Tests are triggered by the continuous training pipeline. Test adequacy metrics and test results are reported in the code repository.

Excellent
: Tests are triggered by the continuous training pipeline. Test adequacy metrics and test result status are reported in the code repository. Test results are reported automatically when a pull request comes in.


The peer review will also contain a free text form.
Please use this form to summarise your assessment of all rubric criteria in this category, especially if you rated something as insufficient.
In addition, explain what you think would be the next important step that needs to be realised.