---
layout: page
title: Release a Webservice
parent: Deployment with GitHub
grand_parent: Material
nav_order: 2
---

# {{page.title}}

In this exercise, we will create a microservice with with *Flask*.
*Flask* is a Python framework and, as such, makes it easy to embed existing Python models.
The focus on the exercise is to build a trivial webservice and to release the results as a container on GitHub.
The exercise will not include any actual model, but should make it very clear how to connect one.

## Preparation

You can reuse the `YOURNAME/remla-test` repository from the previous exercise.
Change your working directory to the folder into which you have checkout the repository.

Start a Python docker image and bind the folder to the running container.
You can also run all examples locally, but the Docker image makes sure that everybody works on the same version.

    $ docker run -it --rm -p8080:8080 -v <path to your checkout>:/root/app/ python:3.7-slim bash
    ... starting container
    (container) $ cd /root/app/

At this point, Python 3.7 is quite dated, but a project that we are going to use as an example relies on it.
In your repository checkout, create a `requirements.txt` with the following content:

    # requirements.txt
    Flask==2.2.4
    flasgger==0.9.4

Restore the dependencies inside of the container.

    $ pip install -r requirements.txt


## Creating a Webservice

In your repository checkout folder, create a file `app.py` with the following content:

```python
from flask import Flask, request
app = Flask(__name__)

@app.route('/', methods=['GET'])
def index():
    return {
        "result": "Some result ...",
    }

app.run(host="0.0.0.0", port=8080, debug=True)
```

Execute this script in your container (make sure that you are in the right folder).

    $ python app.py
     * Serving Flask app 'app'
     * Debug mode: on
    WARNING: This is a development server. Do not use it in a production deployment...
     * Running on all addresses (0.0.0.0)
    ...

If all steps have finished successfully, you can open [localhost:8080](http://localhost:8080/) in your browser.
You should see the hardcoded result.

{: .info}
The example makes use of a `GET` request for illustrative purposes.
To be able to transport parameters, the HTTP methods needs to be changed to `POST`.

## Add some Swagger

You can enable [Swagger][swagger] to make exploring the webservice easier.
Swagger is a tool suite for API developers and the `flasgger` framework integrates Swagger with Flask.
The `requirements.txt` has already declared a corresponding dependency, so all you need to do is to adopt `app.py`.

[swagger]: https://swagger.io

```python
from flask import Flask, request
from flasgger import Swagger

app = Flask(__name__)
swagger = Swagger(app)

@app.route('/', methods=['POST'])
def predict():
    """
    Make a hardcoded prediction
    ---
    consumes:
      - application/json
    parameters:
        - name: input_data
          in: body
          description: message to be classified.
          required: True
          schema:
            type: object
            required: sms
            properties:
                msg:
                    type: string
                    example: This is an example msg.
    responses:
      200:
        description: Some result
    """
    msg = request.get_json().get('msg')
        return {
        "result": "Message was: " + msg,
    }

app.run(host="0.0.0.0", port=8080, debug=True)
```

This snippet has introduced four noteworthy changes.

- An instantiation of Swagger.
- A change of the endpoint from `GET` to `POST`.
- Introduction of an [Open-API specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#operation-object).
- An access to the `request` object, to receive a parameter.

The endpoint can still be used with regular HTTP clients like [curl][curl] or [Postman][postman].
Swagger adds a user-friendly front-end through [localhost:8080/apidocs](http://localhost:8080/apidocs).
The front-end is generated from the API documentation in the endpoint.
Access this front-end and send a custom message.

{: .caution}
Swagger allows a convenient exploration of the endpoints.
Production systems should avoid unecessary services though and direct queries are preferred, e.g., with Postman or `curl`.


[curl]: https://curl.se/
[postman]: https://www.postman.com/

## Create an Image

In the last lecture, you have already practiced the creation of Docker images.
In practice, this is often a very incremental process.
You write the Dockerfile *line by line* and check the image contents after every change.

You can start one of these *intermediate* containers with a shell.
This allows you to test the next steps that you want to add to the Dockerfile (e.g. copying files via [`docker cp`][docker-cp] or simply running commands on the CLI).
When you are sure what to do next, you can extend the Dockerfile, build/start a new container, and check whether the added steps work as intended.

[docker-cp]: https://docs.docker.com/engine/reference/commandline/cp/

In this exercise, all of this work is already done for you, you just need to make sure that all files are in the right place.
Create a Dockerfile with the following content:

    # Dockerfile
    FROM python:3.7-slim
    WORKDIR /root
    COPY requirements.txt /root/
    RUN pip install -r requirements.txt
    COPY app.py /root/
    ENTRYPOINT ["python"]
    CMD ["app.py"]

Images need to be tagged to associate them with a registry and give them a meaningful name.
An image tag needs to have three parts to associate it with GitHub:

- The url of the GitHub Container registry is `ghcr.io`, which must be part of the tag. (i.e., `ghcr.io`)
- The name of the package should resemble your GitHub user and the repository that you have used before (i.e., `YOURNAME/remla-test`).
- Use a unique version (e.g., `0.0.1`)

The full tag would be `ghcr.io/YOURNAME/remla-test:0.0.1`.
This tag must either be provided during build (i.e., `docker build -t <the tag> .`) or the image must be explicitly tagged afterwards (`docker tag <image id> <the tag>`).

Build your image with this tag and try to run it locally.

    $ docker build -t <the tag> .
    ...
    $ docker run -it --rm -p8080:8080 <the tag>

The new container should allow you to interact with the Swagger front-end in the same way as you did before via [localhost:8080/apidocs](http://localhost:8080/apidocs).


## Release the Image

Images are usually released in a registry to share them with others.
In order to interact with the GitHub container registry, you first have to login:

    $ docker login https://ghcr.io
    Username: YOURUSER
    Password: YOURPAT
    Login Succeeded

After that, you can push your newly created image.

    $ docker push <the tag>

Pushing Docker images from your computer associates the image with your GitHub account.
Access your GitHub profile and open the *Packages* tab to see your newly published image.
Images are by default set to *private*, you must explicitly change its visibility to *public* through its settings.

You can also check the status of your image in the GitHub container registry by visiting `https://ghcr.io/YOURNAME/remla-test:0.0.1`.

## Commit your Changes

Do not forget to commit your changes.

    $ git add -A
    $ git commit -m "Add files from Flask exercise"
    $ git push




