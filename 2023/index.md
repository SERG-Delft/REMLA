---
layout: default
title: 2023
hide_from_navbar: false
redirect_from:
  - /
---

# Release Engineering for Machine Learning

In this course, we will go on a journey that starts at continuous integration and then moves on to continuous delivery, continuous deployment, and continuous experimentation. We will discuss the theory and the current research on various related subjects like containerization, testing, or monitoring and will put the learned theory into practice. As a running example, we will build a pipeline for a machine learning application, which – compared to traditional release engineering – poses additional challenges, like data versioning or model deployment.

## Organization

**Course code**       | CS4295 ([Studyguide][Studyguide], [Brightspace][Brightspace])
**Instructors**       | [Sebastian Proksch], [Luís Cruz]
**Lectures**          |	Mondays, 13:45–15:30 <br/> Wednesdays, 10:45–12:30 <br/> Fridays, 13:45–15:30 <br /> (Note that the schedule varies by week)
**Zoom**              | You can find the link on Brightspace.
**ECTS** 	            | 5.0
**Quarter**           | Q4
**Examination type**  | Software project (55%); Essay (40%); Presentation (5%)
**Target audience**   |	Students of the M.Sc. programme in Computer Science
**Requirements** 	  | - Intermediate understanding of OOP languages; <br/> - Practical experience with continuous integration; <br/> - Basic understanding of software testing principles; <br/> - Basic knowledge of machine learning techniques.


## Outline

**Please note:** The program below is tentative and is subject to change.

 Day   | Week| Type | Summary
:------| ---:|---|----------|
 Apr&nbsp;24| 1   | Lecture | **Intro: Course Design and Course Schedule; Project Details** (Slides: [Intro][intro-slides-orga]/[Project][intro-slides-project], [Recording][intro-video])
 Apr&nbsp;26| 1   | Lecture | **Continuous {Integration, Delivery, Deployment}**<!-- <br/>([Slides][slides_02], [Recording][video_02] ) -->

<!--
 Apr&nbsp;28| 2   | Video&nbsp;Lecture | **ML Testing**<br/>(Rec. reading: [[1]](#1), [[2]](#2), [[3]](#3), [Slides][slides_03], [Recording][video_03])
 Apr&nbsp;29| 2   |  Lecture | **Containerization** ([Slides][slides_04], [Recording][video_04])
 May&nbsp;2 | 3   |  Tutorial | **Cont. Delivery with GitHub: Versioning and Registries**<br/>(No Slides, Recordings: [SMS App][video_05a], [MyWeb][video_05b], [MyLib][video_05c])
 May&nbsp;6 | 3   | Lecture | **ML Pipelines & Code Quality** ([Slides][slides_07], [Recording][video_07])
 May&nbsp;9 | 4   | Tutorial  | **ML Configuration Management**<br/> ([Instructions][ML Configuration Management], [Recording][video_07b])
 May&nbsp;11 | 4   | Video Tutorial | **Kubernetes Introduction** ([Slides][slides_08], [Recording][video_08])
 May&nbsp;13 | 4   | Lecture | **Continuous Experimentation** ([Slides][slides_09], [Recording][video_09])
 May&nbsp;16 | 5   | Tutorial | **Automating data validation with TFDV** by [Arumoy Shome](https://arumoy.me) ([Instructions](https://github.com/arumoy-shome/remla), Slides (TODO), [Recording][video_10])
-- | 5   | Feedback | Focus: **Review Current State of Pipeline Re-implementation, Pipeline Extension Proposal** ([Checklist for Requirements](./pipeline_reqs))
-- | 6   | Tutorial | **Monitoring in Kubernetes** (No slides, [Recording][video_11])
-- | 6   | Instructions | **How to write an academic paper?**<br/>([Slides][slides_13], [Start with why][yt-sinek], [Recording][video_13])
-- | 6   | Feedback | Focus: **Review First Draft of ToC + Intro**
-- | 7   | Feedback | **Individual Steering Meetings**
-- | 8   | Instructions | **Presentation tips**<br/>([Slides][slides_14], [Recording][video_14])
-- | 8   | Feedback | **Individual Steering Meetings** -->

Jun&nbsp;19 | 9  | Examination | **Presentation**


## Recommended Reading


- <span id="1">[1]</span> - Eric Breck, Shanqing Cai, Eric Nielsen, Michael Salib, D. Sculley (2016). What’s your ML test score? A rubric for ML production systems. Reliable Machine Learning in the Wild - NIPS 2016 Workshop (2016) [Preprint](https://research.google/pubs/pub45742/).
- <span id="2">[2]</span> - Zhang, J. M., Harman, M., Ma, L., & Liu, Y. (2020). Machine learning testing: Survey, landscapes and horizons. IEEE Transactions on Software Engineering. [Preprint](https://arxiv.org/abs/1906.10742).
- <span id="3">[3]</span> - Sun, Z., Zhang, J. M., Harman, M., Papadakis, M., & Zhang, L. (2020, June). Automatic testing and improvement of machine translation. In Proceedings of the ACM/IEEE 42nd International Conference on Software Engineering (pp. 974-985). [Preprint](https://arxiv.org/abs/1910.02688).
- [4] - Haakman, M., Cruz, L., Huijgens, H., & van Deursen, A. (2020). AI Lifecycle Models Need To Be Revised. An Exploratory Study in Fintech. [Preprint](https://arxiv.org/abs/2010.02716).
- [5] - van Oort, B., Cruz, L., Aniche, M., & van Deursen, A. (2021). The Prevalence of Code Smells in Machine Learning projects. [Preprint](https://arxiv.org/abs/2103.04146).
- <span id="6">[6]</span> - Serban, A., van der Blom, K., Hoos, H., & Visser, J. (2020, October). Adoption and effects of software engineering best practices in machine learning. In Proceedings of the 14th ACM/IEEE International Symposium on Empirical Software Engineering and Measurement (ESEM). [Preprint](https://arxiv.org/abs/2007.14130).
- <span id="7">[7]</span> - Christian Kästner. Machine Learning in Production: From Models to Products. [Book chapters](https://ckaestne.medium.com/machine-learning-in-production-book-overview-63be62393581)


[Sebastian Proksch]: https://proks.ch
[Luís Cruz]: https://luiscruz.github.io
[Studyguide]: https://studiegids.tudelft.nl/a101_displayCourse.do?course_id=61258
[Brightspace]: https://brightspace.tudelft.nl/d2l/home/499353

[intro-slides-orga]: {%surfdrive /material/01_intro_orga.pdf%}
[intro-slides-project]: {%surfdrive /material/01_intro_project.pdf%}
[intro-video]: {%surfdrive /recordings/01_intro_video.mp4%}

[slides_02]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Fslide-exports&files=02_continuous_x.pdf
[slides_03]: https://surfdrive.surf.nl/files/index.php/s/bJeLGmshwPv1JV5
[slides_04]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Fslide-exports&files=04_container_orchestration.pdf
[slides_07]: https://surfdrive.surf.nl/files/index.php/s/Q3E9bGXOfrcK3OQ
[slides_08]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Fslide-exports&files=08_kubernetes_intro.pdf
[slides_09]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Fslide-exports&files=09_continuous_experimentation.pdf
[slides_13]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Fslide-exports&files=13_how_to_write_an_academic_paper.pdf
[slides_14]: https://surfdrive.surf.nl/files/index.php/s/j3EnLiYRQdve1s9

[video_01]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=Apr%2022%20-%20Introduction%20and%20Organization.mp4
[video_02]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=Apr%2025%20-%20Continuous%20X.mp4
[video_03]: https://surfdrive.surf.nl/files/index.php/s/6hfa4qEnPXbCHqg
[video_04]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=Apr%2029%20-%20Containers%20and%20Orchestration.mp4
[video_05a]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=May%202%20-%20Tutorial%20on%20Docker%20and%20Github%20Actions.mp4
[video_05b]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=May%205%20-%20Tutorial%20Part%202%20-%20MyWeb.mp4
[video_05c]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=May%205%20-%20Tutorial%20Part%203%20-%20MyLib.mp4
[video_07]: https://surfdrive.surf.nl/files/index.php/s/Dn7F2yUW3xzeMYo
[video_07b]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=May%2009%20-%20Tutorial%20on%20ML%20Config%20Management.mp4
[video_08]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=08_kubernetes_intro.mp4
[video_09]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=09_continuous_experimentation.mp4
[video_10]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=10_tensor_flow_data_validation.mp4
[video_11]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=11_monitoring_in_kubernetes.mp4
[video_13]: https://surfdrive.surf.nl/files/index.php/s/QbMlMqQDYVGGBWM/download?path=%2Frecordings&files=13_how_to_write_an_academic_paper.mp4
[video_14]: https://surfdrive.surf.nl/files/index.php/s/DIi01yI9GYzlpte

[yt-sinek]: https://www.youtube.com/watch?v=u4ZoJKF_VuA
[ML Configuration Management]: ./tutorials/tutorial_02_ml_pipelines
