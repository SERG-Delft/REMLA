---
layout: page
title: Create an Image
parent: Containerization
grand_parent: Material
nav_order: 2
---

# {{page.title}}


This second exercise will pick-up the `nginx` example from the first part.
This time, we will replace the default page of the image by creating our own image that contains a different default page.

Go to your *test folder* (e.g., `/Users/yourname/test`), in which you have stored the nested `html`.
Create a new file called `Dockerfile` (in the *test folder*, not in the `html` folder).
The `Dockerfile` should have the following content.

    FROM nginx
    COPY html /usr/share/nginx/html

This `Dockerfile` is minimalistic and only contains two instructions:

- The new image will inherit all properties from the [base image](https://docs.docker.com/engine/reference/builder/#from) `nginx` (e.g., files, exposed ports, ...).
- We will alter the base image by [copying](https://docs.docker.com/engine/reference/builder/#copy) the local `html` folder to `/usr/share/nginx/html`, the place in which `nginx` will be looking for the default page.

Before you start building, request a listing of all images that are locally available.
At this point, the list will likely only contain the `nginx` image.

    $ docker images

To build your own image, execute the following `build` command from within your *test folder*, in which the `Dockerfile` is stored (the dot is important).

    $ docker build .
    [+] Building 0.2s (7/7) FINISHED
     => [internal] load build definition from Dockerfile
     => => transferring dockerfile: 129B
     => [internal] load .dockerignore
     => => transferring context: 2B
     => [internal] load metadata for docker.io/library/nginx:latest
     => [internal] load build context
     => => transferring context: 189B
     => [1/2] FROM docker.io/library/nginx
     => [2/2] COPY html/ /usr/share/nginx/
     => exporting to image
     => => exporting layers
     => => writing image sha256:3a4c...

The last line tells you that an image with the id `3a4c...` has been stored.
The command `docker images` will now list this image and include a `<none>` for repository and tag.
The image is fully functional and can be used via its image id.

    $ docker run --rm -p 8080:80 3a4c

However, refering to images via their id is very tedious and hard to remember.
Instead, it is preferrable to *tag* the image.
This can either achieved by running `docker tag 3a4c myimg:1.2.3`, or by directly including one or more tags directly in the build command:

    $ docker build -t myimg:1.2.3 .
    ...
    => => writing image sha256:3a4c...
    => => naming to docker.io/library/myimg:1.2.3

Regardless of which form you chose, a `docker images` will now list your image under the provided name and version.
You can now run the image by name.

    docker run --rm -p8080:80 myimg:1.2.3

Please note that this image is only locally available on your machine.
To make it available to others, you have to `push` it to a registry, like Dockerhub.
We will cover this in one of the upcoming lectures.

