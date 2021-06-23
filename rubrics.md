---
layout: default
title: Rubrics
---
# Rubrics
![Rubric clipart]({{ "img/rubric.svg" | relative_url }}){: height="100px" style="float:right; position:relative; top:-3em"}

<script>
window.onload = (event) => {
    var dts = document.querySelectorAll('dt')
    dts.forEach(dt => {
    	dt.innerHTML = "• " + dt.innerHTML
    })
};
</script>

## Essay

### General (30%)

#### Related work

Insufficient
: There is not a clear link between some references and the content of the paper, or some references come from dubious sources. 

Sufficient
: The work includes relevant references that motivate the work.

Good
: The work includes relevant references that motivate the work. There is a clear and brief explanation of the contributions of each related work.

Excellent
: The work includes relevant references that motivate the work. There is a clear and brief explanation of the contributions of each related work. The paper pinpoints the differences between the proposed solution and the related work.

#### Soundness

Insufficient
: There are arguments that are not technically sound. 

Sufficient
: The arguments laid out are technically sound but should have been better explained. 

Good
: The arguments laid out are technically sound. There are some arguments that lack adequate technical depth but those are not essential to the narrative. 

Excellent
: The arguments laid out are technically sound, and of adequate technical depth.

#### Background

Insufficient
: Key concepts should have been presented in the paper. 

Sufficient
: There are some key concepts that should be defined but they do not affect the clarity of the paper. 

Good
: The paper presents key concepts related to the solution and respective validation.

Excellent
: Clearly, concisely, and logically presents key concepts related to the solution and respective validation.


### Format (30%)

#### Coherence

Insufficient
: Sentences, paragraphs, and sections have a clear change in structure and style. This lack of coherence hinders the clarity of the narrative. 

Sufficient
: Sentences, paragraphs, and sections have a clear change in structure and style. However, this change in style does not hinder the clarity of the narrative.

Good
: Sometimes, sentences, paragraphs, and sections have a slight change of style. However, this change in style does not hinder the clarity of the narrative.

Excellent
: The text is well-structured. Sentences, paragraphs, and sections are coherent.

#### Development

Insufficient
: The flow of narrative is a bit jumpy – i.e, often, the sections do not naturally build upon each other. The conclusion misses a few messages that were developed in the narrative.

Sufficient
: The sections naturally build upon each other and work towards a clear message. However, in 1 or 2 sections, the flow of the narrative is broken. The conclusion misses a few messages that were developed in the narrative.

Good
: The sections naturally build upon each other and work towards a clear message. However, in 1 or 2 sections, the flow of the narrative is sometimes broken. There is a compelling conclusion.

Excellent
: The sections naturally build upon each other and work towards a clear message. There is a compelling conclusion.

#### Correctness

Insufficient
: The text clearly misses proof reading. The clarity of the narrative is hindered by the grammatical and spelling errors.

Sufficient
: The text has a few typos and grammatical mistakes. However, it is still easy to follow the narrative. 

Good
: The English writing is grammatically correct. The text is written in correct standard English, with complete sentences. There are a few typos here an there.

Excellent
: The English writing is grammatically correct. The text is written in correct standard English, with complete sentences, and error-free.

#### Focus

Insufficient
: The text has no clear goal and it is difficult to grasp the main takeaways.

Sufficient
: Sometimes the goal of the text is not clear and some takeaways are not clear.

Good
: Sometimes the goal of the text is not clear but it is easy to grasp the main takeaways.

Excellent
: The text has a clear goal. It is easy to grasp the main takeaways.

#### Unit

Insufficient
: Paragraphs often lack a clear main idea, hindering the flow and understandability of the narrative.

Sufficient
: Some paragraphs deviate from their main idea (c.f. topic sentence).

Good
: All paragraphs follow one main idea and does not deviate from it. The paper is not fully clear for someone that did not follow the course.

Excellent
: All paragraphs follow one main idea and do not deviate from it. The paper is independently readable. 

#### Graphics

Insufficient
: The paper should have more graphics supporting the narrative, and their quality should be improved. Sometimes, the link between the text and the figures is missing.

Sufficient
: There are a few ideas that could have been made clear with an illustrating graphic. Sometimes, the link between the text and the figures is missing.

Good
: The story-line is illustrated with meaningful images and infographics. There is a clear link between the text and the figures.

Excellent
: The story-line is illustrated with meaningful and appealing images and infographics. There is a clear link between the text and the figures.



### Solution (40%)

#### Impact in the Process
How the solution fits the process-pipeline

Insufficient
: It is not clear which part of the process/pipeline the solution is addressing.

Sufficient
: It is clear which stage of the process/pipeline the solution is addressing. It is not clear how the proposed solution improves that stage.

Good
: The solution provides a clear improvement in a particular stage of the ML development and release process.

Excellent
: The solution provides a clear improvement in a particular stage of the ML development and release process. The connection between the improvement and the stage is justified with arguments of adequate technical depth.


#### Novelty

Insufficient
: The solution already exists.

Sufficient
: The solution is not necessarily innovative but it is useful for practitioners.

Good
: The solution is relevant to the fields of Release Engineering or MLOps.

Excellent
: The work creates a novel solution that pushes the state of the art of Release Engineering or MLOps.

#### Description

Insufficient
: The solution is not well-described or presents limitations that should be addressed to solve the proposed problem.

Sufficient
: The solution is well-described but some decisions are not well-grounded. Yet, it does not pose any serious limitation in its ability to the solve the proposed problem.

Good
: The solution is well-described and technically sound. Sometimes, a clear contextualization referring to best practices is missing.

Excellent
: The solution is well-described and technically sound, reflecting best practices in this area of study.

#### Validation

Insufficient
: Even though the paper presents a validation of the solution, it is incomplete.

Sufficient
: The paper presents a validation of the solution. The limitations of the validation are clearly described.

Good
: The paper presents a thorough validation of the solution. The limitations of the validation are minimal and clearly described.

Excellent
: The paper presents a thorough validation of the solution using a real-world context. The limitations of the validation are minimal and clearly described.

#### Generalizability 

Insufficient
: The solution is not ready to be used with the lab project.

Sufficient
: The solution is fully integrated with the lab project.

Good
: The solution is fully integrated with the lab project. On top of that, it is clear that the solution works with real-world projects.

Excellent
: The solution is fully integrated with the lab project. On top of that, there are clear instructions on how to transfer the knowledge or apply the solution to real-world projects.

<!-- #### Readiness

Insufficient
: The public audience cannot use the solution given the artifacts that are publicly available.

Sufficient
:   The solution is available in a public repository but it is somewhat difficult to understand how to use it out of the box.

Good
:         The solution is available in a public repository and ready to be used by practitioners. The repo could be improved with more complete descriptions/instructions.

Excellent
:    The solution is available in a public repository and ready to be used by practitioners. Clear instructions on how to use and reproduce the work are described in the repo. -->

<!-- #### Quality Control

I suggest we check this in the implementation

#### Version Control

I suggest we check this in the Implementation... -->



## Final Pipeline

### Pass/fail

To be considered as an appropriate submission, the final pipeline needs to fullfil the following requirements.

- Team has a working CD pipeline (e.g., by extending the pipeline from the tutorials)
- All code and configuration of the pipeline is accessible in a public repository
- A compressed version of the repository has been sent to the organizers

### Grading

#### The pipeline extension introduces a substantial change over the tutorial pipeline.

Insufficient
: Minor changes/extension compared to “tutorial pipeline”

Sufficient
: Group has provided a feature that extends the existing pipeline with obvious value

Good
: The provided feature is substantial, both conceptually and also from the required code/configuration.

Excellent
: The provided feature touches multiple phases and/or has several subcomponents


#### The used technology is appropriate.

Insufficient
: Integrating the extension is unnatural and breaks the workflows of a common Docker/Kubernetes setup, like the tutorial project.

Sufficient
: Proposed extension fits into the workflow of a common Docker/Kubernetes setup.

Good
: The pipeline extension naturally fits a Docker/Kubernetes setup and applies existing battle-proven technology or concepts.

Excellent
: The pipeline extension naturally fits a Docker/Kubernetes setup and applies existing battle-proven technology or concepts in a new way or implements a new technique.


#### The pipeline extension can be ported to other projects/is usable by others.

Insufficient
: Pipeline cannot be replicated 

Sufficient
: All necessary code and configurations are available in a public repository.

Good
: Pipeline extension can be migrated to another project, the process is clearly documented.

Excellent
: The pipeline extension is easy to configure and reusing/integrating it in other projects is made easy (e.g., by providing reusable/configurable containers or Maven goals).


#### The pipeline extension is automated and supports the release decision.

Insufficient
: The extension requires manual execution.

Sufficient
: The execution is automatically triggered, results have to be manually inspected (e.g., looking at a dashboard).

Good
: The execution is automatically triggered, inspection of the results can be planned (e.g., in code review).

Excellent
: Both the execution and the impact on the release decision are automated processes.



