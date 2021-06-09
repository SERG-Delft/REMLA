---
layout: default
title: Rubrics
---
# Rubrics
![Rubric clipart]({{ "img/rubric.svg" | relative_url }}){: height="100px" style="float:right; position:relative; top:-3em"}

## Essay

### General (30%)

#### Related work

**Insufficient:** There is not a clear link between some references and the content of the paper, or some references come from dubious sources. <br/>
**Sufficient:** The work includes relevant references that motivate the work.<br/>
**Good:** The work includes relevant references that motivate the work. There is a clear and brief explanation of the contributions of each related work.<br/>
**Excellent:** The work includes relevant references that motivate the work. There is a clear and brief explanation of the contributions of each related work. The paper pinpoints the differences between the proposed solution and the related work.

#### Soundness

**Insufficient:** There are arguments that are not technically sound. <br/>
**Sufficient:** The arguments laid out are technically sound but should have been better explained. <br/>
**Good:** The arguments laid out are technically sound. There are some arguments that lack adequate technical depth but those are not essential to the narrative. <br/>
**Excellent:** The arguments laid out are technically sound, and of adequate technical depth.

#### Background

**Insufficient:** Key concepts should have been presented in the paper. <br/>
**Sufficient:** There are some key concepts that should be defined but they do not affect the clarity of the paper. <br/>
**Good:** The paper presents key concepts related to the solution and respective validation.<br/>
**Excellent:** Clearly, concisely, and logically presents key concepts related to the solution and respective validation.


### Format (30%)

#### Coherence

**Insufficient:** Sentences, paragraphs, and sections have a clear change in structure and style. This lack of coherence hinders the clarity of the narrative. <br/>
**Sufficient:** Sentences, paragraphs, and sections have a clear change in structure and style. However, this change in style does not hinder the clarity of the narrative.<br/>
**Good:** Sometimes, sentences, paragraphs, and sections have a slight change of style. However, this change in style does not hinder the clarity of the narrative.<br/>
**Excellent:** The text is well-structured. Sentences, paragraphs, and sections are coherent.

#### Development

**Insufficient:** The flow of narrative is a bit jumpy – i.e, often, the sections do not naturally build upon each other. The conclusion misses a few messages that were developed in the narrative.<br/>
**Sufficient:** The sections naturally build upon each other and work towards a clear message. However, in 1 or 2 sections, the flow of the narrative is broken. The conclusion misses a few messages that were developed in the narrative.<br/>
**Good:** The sections naturally build upon each other and work towards a clear message. However, in 1 or 2 sections, the flow of the narrative is sometimes broken. There is a compelling conclusion.<br/>
**Excellent:** The sections naturally build upon each other and work towards a clear message. There is a compelling conclusion.

#### Correctness

**Insufficient:** The text clearly misses proof reading. The clarity of the narrative is hindered by the grammatical and spelling errors.<br/>
**Sufficient:** The text has a few typos and grammatical mistakes. However, it is still easy to follow the narrative. <br/>
**Good:** The English writing is grammatically correct. The text is written in correct standard English, with complete sentences. There are a few typos here an there.<br/>
**Excellent:** The English writing is grammatically correct. The text is written in correct standard English, with complete sentences, and error-free.

#### Focus

**Insufficient:** The text has no clear goal and it is difficult to grasp the main takeaways.<br/>
**Sufficient:** Sometimes the goal of the text is not clear and some takeaways are not clear.<br/>
**Good:** Sometimes the goal of the text is not clear but it is easy to grasp the main takeaways.<br/>
**Excellent:** The text has a clear goal. It is easy to grasp the main takeaways.

#### Unit

**Insufficient:** Paragraphs often lack a clear main idea, hindering the flow and understandability of the narrative.<br/>
**Sufficient:** Some paragraphs deviate from their main idea (c.f. topic sentence).<br/>
**Good:** All paragraphs follow one main idea and does not deviate from it. The paper is not fully clear for someone that did not follow the course.<br/>
**Excellent:** All paragraph follow one main idea and does not deviate from it. The paper is independently readable. 

#### Graphics

**Insufficient:** The paper should have more graphics supporting the narrative, and their quality should be improved. Sometimes, the link between the text and the figures is missing.<br/>
**Sufficient:** There are a few ideas that could have been made clear with an illustrating graphic. Sometimes, the link between the text and the figures is missing.<br/>
**Good:** The story-line is illustrated with meaningful images and infographics. There is a clear link between the text and the figures.<br/>
**Excellent:** The story-line is illustrated with meaningful and appealing images and infographics. There is a clear link between the text and the figures.



### Solution (40%)

#### Impact in the Process
How the solution fits the process-pipeline

**Insufficient:** It is not clear which part of the process/pipeline the solution is addressing.<br/>
**Sufficient:**   It is clear which stage of the process/pipeline the solution is addressing. It is not clear how the proposed solution improves that stage.<br/>
**Good:**         The solution provides a clear improvement in a particular stage of the ML development and release process. <br/>
**Excellent:**    The solution provides a clear improvement in a particular stage of the ML development and release process. The connection between the improvement and the stage is justified with arguments of adequate technical depth.


#### Novelty

**Insufficient:** The solution already exists.<br/>
**Sufficient:**   The solution is not necessarily innovative but it is useful for practitioners.<br/>
**Good:**         The solution is relevant to the fields of Release Engineering or MLOps.<br/>
**Excellent:**    The work creates a novel solution that pushes the state of the art of Release Engineering or MLOps.

#### Soundness

**Insufficient:** The solution is not well-described or presents limitations that should be addressed to solve the proposed problem.<br/>
**Sufficient:**   The solution is well-described but some decisions are not well-grounded. Yet, it does not pose any serious limitation in its ability to the solve the proposed problem. <br/>
**Good:**         The solution is well-described and technically sound. Sometimes, a clear contextualization referring to best practices is missing.<br/>
**Excellent:**    The solution is well-described and technically sound, reflecting best practices in this area of study.

#### Validation

**Insufficient:** Even though the paper presents a validation of the solution, it is incomplete.<br/>
**Sufficient:**   The paper presents a validation of the solution. The limitations of the validation are clearly described.<br/>
**Good:**         The paper presents a thorough validation of the solution. The limitations of the validation are minimal and clearly described.<br/>
**Excellent:**    The paper presents a thorough validation of the solution using a real-world context. The limitations of the validation are minimal and clearly described.

#### Generalizability 

**Insufficient:** The solution is not ready to be used with the lab project.<br/>
**Sufficient:**   The solution is fully integrated with the lab project.<br/>
**Good:**         The solution is fully integrated with the lab project. On top of that, it is clear that the solution works with real-world projects.<br/>
**Excellent:**    The solution is fully integrated with the lab project. On top of that, there are clear instructions on how to transfer the knowledge or apply the solution to real-world projects.

<!-- #### Readiness

**Insufficient:** The public audience cannot use the solution given the artifacts that are publicly available.<br/>
**Sufficient:**   The solution is available in a public repository but it is somewhat difficult to understand how to use it out of the box.<br/>
**Good:**         The solution is available in a public repository and ready to be used by practitioners. The repo could be improved with more complete descriptions/instructions.<br/>
**Excellent:**    The solution is available in a public repository and ready to be used by practitioners. Clear instructions on how to use and reproduce the work are described in the repo. -->

<!-- #### Quality Control

I suggest we check this in the implementation

#### Version Control

I suggest we check this in the Implementation... -->



## Final Pipeline

### Pass/fail

To be considered as an appropriate submission, the final pipeline needs to fullfil the following requirements.

- Team has established a proper CD pipeline
- Has quality control measures
- ..?


### Grading

#### “size” of the change

- insufficient: Minor changes/extension to “tutorial pipeline”
- sufficient: group has provided a feature that extends the existing pipeline with obvious value
- good: the provided feature is substantial.
- excellent: the provided feature touches multiple phases and/or has several subcomponents

#### “maturity” (documentation, release status)

- insufficient: The realization of the new feature is not yet stable enough to be continuously by the group
- sufficient: The group uses the new feature themselves (“proof of concept”)
- good: The solution is released and can be customized, simple “change pointers” are provided
- excellent: Integration is made easy through configuration points and well defined documentation

#### portability/usability (for others)

- insufficient: 
- sufficient: Necessary tools are part of the group repository
- good: tools are released (e.g., in a Maven repository)
- excellent: tools can be easily reused/integrated in other projects (e.g., through Docker or Maven goals)


#### automation of quality control?
- insufficient: just manual execution
- sufficient: automated execution, accidental inspection
- good: automated execution, planned inspection
- excellent: fully automated


#### Apply version control techniques to source code and machine learning artifacts (data, models)


- Insufficient: Repo
- sufficient: simple increments
- good: “snapshots”
- Excellent: semantic versioning


#### ..?

- Extent of CE?
- Monitoring supports release decision?



