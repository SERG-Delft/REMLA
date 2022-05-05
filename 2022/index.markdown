---
layout: default
title: REMLA
redirect_from:
  - /
---

# Release Engineering for Machine Learning

📣 **Announcement:** 📣 The link to the the Zoom meeting will be shared via [Brightspace] before the class. 

In this course, we will go on a journey that starts at continuous integration and then moves on to continuous delivery, continuous deployment, and continuous experimentation. We will discuss the theory and the current research on various related subjects like containerization, testing, or monitoring and will put the learned theory into practice. As a running example, we will build a pipeline for a machine learning application, which – compared to traditional release engineering – poses additional challenges, like data versioning or model deployment.

## Learning Objectives

After following this course, you will be able to:

- Apply standard techniques of release engineering;
- Apply version control techniques to machine learning artefacts, like data or models Design a deployment pipeline for a machine learning application;
- Implement quality control techniques in a machine learning pipeline;
- Analyze and improve existing deployment pipelines;
- Evaluate and document design decisions in deployment pipelines.

## Organization

**Course code**       | [CS4295]
**Instructors**       | [Sebastian Proksch], [Luís Cruz]
**Schedule**          |	Mondays, 13:45–15:30 <br/> Fridays, 13:45–15:30
**ECTS** 	            | 5.0
**Quarter**           | Q4
**Communication**     | Mattermost: [join the REMLA 2022 team](https://mattermost.tudelft.nl/signup_user_complete/?id=fgaxpprdnj83zewkcnzt44rhrc).
**Examination type**  | Software project (35%); Essay (60%); Presentation (5%)
**Target audience**   |	Students of the M.Sc. programme in Computer Science
**Requirements** 	  | - Intermediate understanding of OOP languages; <br/> - Practical experience with continuous integration; <br/> - Basic understanding of software testing principles; <br/> - Basic knowledge of machine learning techniques.


## Outline

**Please note:** The program below is tentative and is subject to change.

 Day   | Week| Type | Summary
------:| ---:|---|----------|
 22&nbsp;Apr| 1   | Lecture | Introduction: Organization and Course Schedule; Tutorials and Final Project. ([Intro Slides](https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Fslide-exports&files=01_Intro_Orga.pdf), [Project Slides](https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Fslide-exports&files=01_intro_tutorials_project.pdf), [Recording](https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=Apr%2022%20-%20Introduction%20and%20Organization.mp4))
 25 Apr| 1   | Lecture | Continuous {Integration, Delivery, Deployment}. ([Slides](https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Fslide-exports&files=02_continuous_x.pdf), [Recording](https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=Apr%2025%20-%20Continuous%20X.mp4)  )
 28 Apr| 2   | Video Lecture | ML Testing. Recommended reading: [[1]](#1), [[2]](#2), and [[3]](#3). ([Slides][slides_03], [Recording][video_03])
 29 Apr| 2   |  Lecture | Container Orchestration. ([Slides](https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Fslide-exports&files=04_container_orchestration.pdf), [Recording](https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=Apr%2029%20-%20Containers%20and%20Orchestration.mp4))
 2 May | 3   |  Tutorial | Practicing Docker, Docker Compose, GitHub Actions, and GitHub Packages. ([SMS App](https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=May%202%20-%20Tutorial%20on%20Docker%20and%20Github%20Actions.mp4), [MyWeb](https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=May%205%20-%20Tutorial%20Part%202%20-%20MyWeb.mp4), [MyLib](https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=May%205%20-%20Tutorial%20Part%203%20-%20MyLib.mp4))
 4 May | 3   |  Video Lecture | From Docker Compose to Kubernetes
 6 May | 3   | Lecture | ML Pipelines
 9 May | 4   | Lecture | ML Config Management
 11 May | 4   | Lecture | Monitoring and Continuous Experimentation
 13 May | 4   | Lecture | Tutorial: Monitoring your Kubernetes Deployment
-- | 5   | Feedback | Review Current Pipeline, Pipeline Extension Proposal
-- | 6   | Feedback | First Draft of ToC + Intro
-- | 7   | Feedback | Individual Steering Meetings
-- | 8   | Feedback | Individual Steering Meetings
 13 Jun | 9  | Examination | Presentation

#### Graphical outline

![Outline 2022](../img/outline-2022.png)

## Recommended Reading

- <span id="1">[1]</span> - Eric Breck, Shanqing Cai, Eric Nielsen, Michael Salib, D. Sculley (2016). What’s your ML test score? A rubric for ML production systems. Reliable Machine Learning in the Wild - NIPS 2016 Workshop (2016) [Preprint](https://research.google/pubs/pub45742/).
- <span id="2">[2]</span> - Zhang, J. M., Harman, M., Ma, L., & Liu, Y. (2020). Machine learning testing: Survey, landscapes and horizons. IEEE Transactions on Software Engineering. [Preprint](https://arxiv.org/abs/1906.10742).
- <span id="3">[3]</span> - Sun, Z., Zhang, J. M., Harman, M., Papadakis, M., & Zhang, L. (2020, June). Automatic testing and improvement of machine translation. In Proceedings of the ACM/IEEE 42nd International Conference on Software Engineering (pp. 974-985). [Preprint](https://arxiv.org/abs/1910.02688).
- [4] - Haakman, M., Cruz, L., Huijgens, H., & van Deursen, A. (2020). AI Lifecycle Models Need To Be Revised. An Exploratory Study in Fintech. [Preprint](https://arxiv.org/abs/2010.02716).
- [5] - van Oort, B., Cruz, L., Aniche, M., & van Deursen, A. (2021). The Prevalence of Code Smells in Machine Learning projects. [Preprint](https://arxiv.org/abs/2103.04146).
- <span id="6">[6]</span> - Serban, A., van der Blom, K., Hoos, H., & Visser, J. (2020, October). Adoption and effects of software engineering best practices in machine learning. In Proceedings of the 14th ACM/IEEE International Symposium on Empirical Software Engineering and Measurement (ESEM). [Preprint](https://arxiv.org/abs/2007.14130).



[Sebastian Proksch]: https://proks.ch
[Luís Cruz]: https://luiscruz.github.io
[CS4295]: https://studiegids.tudelft.nl/a101_displayCourse.do?course_id=56383
[Brightspace]: https://brightspace.tudelft.nl/d2l/home/399673

[slides_03]: https://surfdrive.surf.nl/files/index.php/s/bJeLGmshwPv1JV5

[video_03]: https://surfdrive.surf.nl/files/index.php/s/6hfa4qEnPXbCHqg

