---
layout: page
title: SMS Spam
has_children: false
has_toc: false
parent: Projects
grand_parent: Material
nav_order: 1
---

# {{page.title}}

The [SMS Spam][sms-project] project is a simply machine-learning project that illustrates how to detect spam messages.
The project is an adopted version of another [GitHub project][sms-original].
The following guide will explain you how a model can be trained and served.

To use this model, clone the [SMS Spam][sms-project] repository and perform the following steps.
It is recommended to run the code in a Python 3.7 environment.

{: .info}
We have adapted the original project. The instructions only work with our extension.

[sms-original]: https://github.com/rohan8594/SMS-Spam-Detection
[sms-project]: https://github.com/proksch/sms1
[sms-model]: {%surfdrive /projects/sms-spam/model.joblib%}


## Training

In contrast to the original project, we provide a `requirements.txt` file that can be used to restore the required dependencies in your environment.

To train the model, you have two options.
Either you create a local environment...

    $ python -m venv venv
    $ source venv/bin/activate
    $ pip install -r requirements.txt

... or you can prepare a Docker container for the training:

    $ docker run -it --rm -v /path/to/project/:/root/sms/ python:3.7-slim bash
    ... (container gets started)
    $ cd /root/sms/
    $ pip install -r requirements.txt

Once all dependencies have been installed, the data can be preprocessed and the model trained by invoking three commands:

    $ python src/read_data.py
    Total number of messages:5574
    ...
    $ python src/text_preprocessing.py
    [nltk_data] Downloading package stopwords to /root/nltk_data...
    [nltk_data]   Unzipping corpora/stopwords.zip.
    ...
    $ python src/text_classification.py

The resulting model files will be placed as `.joblib` files in the `output/` folder.


## Serving Recommendations

The trained model can be used by Python programs.
However, we want to use it cross-language in a distributed application, as such, it is more convenient to wrap it in a micro service.

In the *SMS Spam* project, you can find a Dockerfile.
For convenience, the Dockerfile contains all required steps for training the model, embedding the model in the image, and for preparing an executable application.
You can build the image with the command `docker build -t smsapp .` and then run it by executing `docker run -it --rm -p8080:8080 smsapp`.

Once the application is started, you can either access `localhost:8080/apidocs` with your browser or send `POST` requests to `localhost:8080/predict` to request predictions.
