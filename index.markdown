---
layout: default
title: REMLA
---

# Release Engineering for Machine Learning

📣 **Announcement:** 📣 The link to the the Zoom meeting was shared via [Brightspace]. 

In this course, we will go on a journey that starts at continuous integration and then moves on to continuous delivery, continuous deployment, and continuous experimentation. We will discuss the theory and the current research on various related subjects like containerization, testing, or monitoring and will put the learned theory into practice. As a running example, we will build a pipeline for a machine learning application, which – compared to traditional release engineering – poses additional challenges, like data versioning or model deployment.

## Learning Objectives

After following this course, you will be able to:

- Apply standard techniques of release engineering;
- Apply version control techniques to machine learning artifacts, like data or models Design a deployment pipeline for a machine learning application;
- Implement quality control techniques in a machine learning pipeline;
- Analyze and improve existing deployment pipelines;
- Evaluate and document design decisions in deployment pipelines.

## Organization

**Course code**       | [CS4295]
**Instructors**       | [Sebastian Proksch], [Luís Cruz]
**Schedule**          |	Mondays, 15:45–17:45 <br/> Wednesdays, 13:45–15:45 <br/> Fridays, 13:45–15:45
**ECTS** 	          | 5.0
**Quarter**           | Q4
**Examination type**  | Software project (35%); Essay (60%); Presentation (5%)
**Target audience**   |	Students of the M.Sc. programme in Computer Science
**Requirements** 	  | - Intermediate understanding of OOP languages; <br/> - Practical experience with continuous integration; <br/> - Basic understanding of software testing principles; <br/> - Basic knowledge of machine learning techniques.


## Outline

**Please note:** The program below is tentative and is subject to change.

 Day   | Week| Summary
------:| ---:|----------|
 19&nbsp;Apr| 1   | **Lecture:** Introduction: Organization and Course Schedule ([slides](./slides/01_intro_orga.pdf)); Tutorials and Final Project ([slides](./slides/01_intro_tutorials_project.pdf)).
 21 Apr| 1   | **Lecture:** Continuous {Integration, Delivery, Deployment} ([slides](./slides/02_deployment.pdf), [video](https://surfdrive.surf.nl/files/index.php/s/fjjlQLdFm1on2Pj)).
 23 Apr| 1   | **Lab:** Deployment in Practice: GitLab and Digital Ocean ([video](https://surfdrive.surf.nl/files/index.php/s/bd0goJcVS4uWG6x)).
 26 Apr| 2   | **Lecture:** Containers & Orchestration ([slides](./slides/03_container_orchestration.pdf), [video](https://surfdrive.surf.nl/files/index.php/s/rOah0G9GlaFf77B)).
 28 Apr| 2   | **Lab:** Containerization in Practice: Docker & Docker Compose
 30 Apr| 2   | **Lecture:** ML Testing. Recommended reading: *Machine learning testing: Survey, landscapes and horizons* [[1]](#1); also covering [[2]](#2) and [[3]](#3).
  3 May| 3   | **Lecture:** ML Pipelines; Guest Lecture: [Alex Serban] on ML Best Practices. Recommended reading: *Adoption and effects of software engineering best practices in machine learning* [[4]](#4). 
  5 May| 3   | **No class:** *Public Holiday*
  7 May| 3   | **Lab:** ML pipeline management 
 10 May| 4   | **Lecture:** Continuous Experimentation
 12 May| 4   | **Lab:** Define Metrics, Instrument App, Logging
 14 May| 4   | **No class:** *Public Holiday*
 17 May| 5   | Literature Survey
 19 May| 5   | **Lecture:** How to write a paper / how to present
 21 May| 5   | **Feedback Session:** Review Current Pipeline, Pipeline Extension Proposal
 TBD   | 6   | **Feedback Session:** First Draft of ToC + Intro
 TBD   | 7   | **Feedback Session:** Individual Steering Meetings
 TBD   | 8   | **Feedback Session:** Sketch of Methodology or new pipeline
 TBD   | 9   | TBD
 21 Jun| 10  | **Assessment:** Essay and Presentation
  ............  | | 



## Recommended Reading

- <span id="1">[1]</span> - Zhang, J. M., Harman, M., Ma, L., & Liu, Y. (2020). Machine learning testing: Survey, landscapes and horizons. IEEE Transactions on Software Engineering. [Preprint](https://arxiv.org/abs/1906.10742).
- <span id="2">[2]</span> - Eric Breck, Shanqing Cai, Eric Nielsen, Michael Salib, D. Sculley (2016). What’s your ML test score? A rubric for ML production systems. Reliable Machine Learning in the Wild - NIPS 2016 Workshop (2016) [Preprint](https://research.google/pubs/pub45742/)
- <span id="3">[3]</span> - Sun, Z., Zhang, J. M., Harman, M., Papadakis, M., & Zhang, L. (2020, June). Automatic testing and improvement of machine translation. In Proceedings of the ACM/IEEE 42nd International Conference on Software Engineering (pp. 974-985). [Preprint](https://arxiv.org/abs/1910.02688)
- [4] - Haakman, M., Cruz, L., Huijgens, H., & van Deursen, A. (2020). AI Lifecycle Models Need To Be Revised. An Exploratory Study in Fintech. [Preprint](https://arxiv.org/abs/2010.02716).
- [5] - van Oort, B., Cruz, L., Aniche, M., & van Deursen, A. (2021). The Prevalence of Code Smells in Machine Learning projects. [Preprint](https://arxiv.org/abs/2103.04146).
- <span id="6">[6]</span> - Serban, A., van der Blom, K., Hoos, H., & Visser, J. (2020, October). Adoption and effects of software engineering best practices in machine learning. In Proceedings of the 14th ACM/IEEE International Symposium on Empirical Software Engineering and Measurement (ESEM). [Preprint](https://arxiv.org/abs/2007.14130).



[Sebastian Proksch]: https://proks.ch
[Luís Cruz]: https://luiscruz.github.io
[CS4295]: https://studiegids.tudelft.nl/a101_displayCourse.do?course_id=56383
[Alex Serban]: https://cs.ru.nl/~aserban/
[Brightspace]: https://brightspace.tudelft.nl/d2l/home/280442
