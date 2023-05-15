---
layout: page
title: Final Submissions
has_children: false
has_toc: false
parent: Assignments
---

# {{ page.title }}

We will use the [Peer][peer] system for the peer review.
You will find the course in the list.
As we have imported the groups already, you are likely already associated with the course as a student.

[peer]: https://peer.tudelft.nl/

#### Submission

Every assignment is completed by registering your solution in [Peer][peer].
You do not have to submit source code, we only expect a list of links to your GitHub organization and relevant repositories.

Unfortunately, Peer does not support text fields, so you _must_ upload a .pdf file for an assignment.
This file can be basic and just needs to provide all information that others need to review your code.
Most importantly, it does not need to include any instructions.
If instructions are required, please add them to the `README.md` in your repositories.

#### File Format

The submitted file can be a simple listing of links.
To make it easy for others to find you code, we recommend to perform two steps for a submission:

1. Create a git _tag_ in your respective repositories to mark the state that should be reviewed.
   Keep it simple, using tags like `a1`, `a2`, ... is clear enough.
2. Create a brief document with the following structure.
   Please use repository links that [refer to a tag][by-tag] and [not(!) to a commit][by-commit] (compare the two links), to create stable links.
   You can reuse the document for every submission, you should just update the links to the new tag every time.

[by-commit]: https://github.com/remla22/sms-spam-detection/tree/a598af3165d179f79bb3db9f40278cea2f9c4587
[by-tag]: https://github.com/remla22/sms-spam-detection/tree/v0.0.2

```
    organization: https://github.com/remla23-teamXX (update with your own link)
    model training: ...
    model service: ...
    lib: ...
    (and so on)
```

{:.info}
You can create the tag and submit the file even before your work is done to make sure that you do not miss the deadline.
The Git tag can then be moved should you want to register an update.
We ask you though to please not update the tag anymore, once the review phase has started.
You should make sure that all reviews look at the same state for consistency.

#### Group Work

The assignments must be registered for Peer review by uploading the file.
Your groups have been registered in the system, so it is sufficient, if _one_ team member uploads the document.
Please note that the peer review, however, must be completed by every team member individually.

#### Peer Review Phase

Once the assignment deadline is over, [Peer][peer] will transition into the review phase.
Everyone will get two reviews assigned: a random team and their own team.
For both reviews, you are supposed to fill a questionnaire that reflects the [assessment rubrics][assessment].
In Peer, we cannot really format the questions, so we expect that you keep the rubrics on this website open, as they contain more details.

The Peer Review phase has a separate deadline, to make sure that everybody receives timely feedback on their work.
While you can submit late, you will not see any of your own feedback until you have completed both review tasks.

{:.info}
Constructive participation in the review process is a [pass/fail criteria][assessment] of the course.
Students that repeatedly miss the deadlines will fail the course.

[assessment]: {%link assessment/index.md%}
