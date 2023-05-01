---
layout: page
title: Train & Serve a Model
parent: Deployment with GitHub
grand_parent: Material
---

# {{page.title}}

The [SMS Spam][sms-spam] project is used as a running example.
Start this exercise by investigating the corresponding [GitHub repository][sms-github] and perform the following tasks:

- Read the instructions of the `README.md`.
- Locate the spots in the repository that have been covered by todays exercises.
- Understand how the trained model is integrated into Flask (see `src/serve_model.py`).
- Study the Dockerfile to understand how the image is built.

These tasks should provide you with a good understanding of the projects structure and organization.
Now, follow the instructions of the [SMS Spam][sms-spam] project to build and run a local image.
Ultimately, you should be able to query the model via that Swagger UI that is accessible via [localhost:8080/apidocs](http://localhost:8080/apidocs).




[sms-spam]: {%link material/projects/sms-spam.md%}
[sms-github]: https://github.com/proksch/sms1