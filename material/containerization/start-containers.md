---
layout: page
title: Start Containers
parent: Containerization
grand_parent: Material
nav_order: 1
---

# {{page.title}}

In this first exercise, we will practice some fundamental Docker commands.
Before you start with the exercises, you want to make sure that you have installed Docker correctly and that your Docker daemon is running.
Check whether you can request information about your installed Docker version.

    $ docker -v
    Docker version 20.10.23, build 7155243

If this part succeeds (your version will likely differ), run `docker ps` to list all running containers.
If the Docker daemon is not running, you will receive an error message like this:

    $ docker ps
    Error response from daemon: dial unix docker.raw.sock: connect: connection refused

If successful, however, the output should look like:

    $ docker ps
    CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

If you see output that is along these lines, you are ready to move on to the actual exercises.


## Start Container and Connect

As introduced in the lecture, you can start containers with the `docker run` command.
You need to refer to a valid image name, like `nginx` (a webserver), and might need to provide parameters.

Run the following command to start an `nginx` webserver instance in your Docker environment.
On your first time, the invocation might take some seconds as the image still needs to be downloaded from Dockerhub.
You can find details about the image in the [package documentation on Dockerhub](https://hub.docker.com/_/nginx/).

    $ docker run -p 8080:80 -d nginx
    ... some hash ...

- Do not copy the `$` part, it is used to indicate input on the shell.
- `-p 8080:80` maps the exposed container port 80 to the local port 8080.
- `-d` instructs Docker to start the container as a background daemon.

Use your browser and visit [http://localhost:8080](http://localhost:8080) to see the start page of `nginx`.

You might receive an error message like `docker: Error response from daemon: driver failed programming external connectivity on endpoint fervent_darwin (...): Bind for 0.0.0.0:8080 failed: port is already allocated.` This means that port 8080 is already taken on your local machine.
In this case, just pick *any* other port (<65535).

Now that you have started a container, you can execute more commands to further explore the capabilities of the Docker client.
As a first step, run `docker ps -a` to see all active containers on your machine (running and stopped). The last column in this overview is the internal *name* of each container. You can use these names whenever you want to interact with a particular container.

In contrast to `run`, an `exec` will connect to an already running container and execute an additional process in the same context.

    $ docker exec -it SOMENAME bash

- `-it` instructs Docker to use an *interactive terminal*
- The command refers to a container named `SOMENAME` (use `docker ps` to find the actual name of your `nginx` container).
- The last parameter (`bash`) refers to a command shell in the container.

When the previous command was run successfully, a shell is waiting for your input.
Run the command `cat /usr/share/nginx/html/index.html` to print the content of the default page that you have seen in your browser to the terminal.
To illustrate that your actions in the container have an effect, you can also run `echo "Hello World!" > /usr/share/nginx/html/index.html` *in your container*.
Reloading the website in your browser should then show changed content.

Press `Ctrl+C` ("Abort current program") and `Ctrl+D` ("Stop current shell") to get out of the container shell and back to your host.
The container is still running in the background (check `docker ps -a`).
Run `docker stop SOMENAME` to stop it, reloading your browser will fail then fail.
Delete this container by running `docker rm SOMENAME`.
Calling `docker ps -a` should now show you an empty list.



## Change HTML Content By Mounting a Volume

It would be cumbersome to manually change the website of each `nginx` container, so we will prepare the content outside of the container and simply *mount* it into the right place.

Create a *test folder* on your computer in which you can edit files (e.g., `/Users/yourname/test`). Inside this *test folder*, create a nested folder called `html`, in which you create a file called `index.html`.
Open this file and save it with the following content:

    <html>
    <body style="background-color:red;">
    Hello World!
    </body>
    </html>

We can now start the `nginx` container again, but this time, we will mount the folder to replace the default website.

    $ docker run --rm -p 8080:80 -v /Users/yourname/test/html/:/usr/share/nginx/html/ nginx

- The command omits the `-d` that has been used before. As such, all output will be printed on the terminal. The container is killed by pressing `Ctrl+C` and `Ctrl+D`.
- `--rm` will result in an auto-deletion of the container after stopping it.
- `-v FROM:TO` will mount the local folder `FROM` to container folder `TO`. The seems to be OS dependent, if you have troubles getting it to work, leave out the trailing `/` characters in `FROM` and `TO`.

If the command finished successfully, you can visit [http://localhost:8080](http://localhost:8080) again.
You should see your custom page.
Try changing the `index.html` file on your host system, the changes should be directly reflected when you reload the page.

Press `Ctrl+C` and `Ctrl+D` again to exit your container.
A `docker ps -a` should not contain any entry anymore, when you have used the `--rm` parameter.


