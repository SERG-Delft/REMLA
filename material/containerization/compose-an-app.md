---
layout: page
title: Compose an Application
parent: Containerization
grand_parent: Material
---

# {{page.title}}

As a last exercise step, we want to use Docker compose to first replicate the previous example and then to compose a more complex deployment with a load balancer.

Before you start, change your working directory again to your *test folder* (e.g., `/Users/yourname/test/`).


## Start a basic example

As the very first step, we replicate the Docker usage of the [first exercise]({%link material/containerization/start-containers.md%}), in which we have mounted a folder into an `nginx` container.
Create a file called `docker-compose.yml` in your *test folder* and save it with the following content.
Make sure that the indentation is consistent!


    # docker-compose.yml
    services:
      NAME:
        image: nginx
        ports:
          - 8080:80
        volumes:
          - ./html:/usr/share/nginx/html/

This example defines a single service called `NAME`.
This service will be based on the base image `nginx`, forward local accesses to port 8080 to the container port 80, and mount the `html` directory into the container.

To start the application use `up`.

    $ docker-compose up -d
    [+] Running 1/1
     ✔ Container test-NAME-1  Started

With your browser, visit [http://localhost:8080](http://localhost:8080) to validate that `nginx` is working.
Container names are derived from the enclosing folder and from the service name, so you will see that `docker ps -a` will list a running container called `test-NAME-1`.

When executed from the folder, in which the compose file is located, you can use `docker-compose stop` and `docker-compose start` to start and stop the container.
`docker-compose logs` will give you access to the logs when the deployment is started as a daemon.

When you are done, invoke `docker-compose down` to shutdown the deployment again and remove all traces.
You will see that `docker ps -a` will show an empty list again.


## Deploy a composed application

As a second example, we will deploy an application that is composed of multiple containers.
The idea is to reuse the results of the previous exercises, start two `nginx` instances with different websites, and put a load balancer in front of them.

For this exercise, make sure that your working directory is still the *test folder*.
As a first step, copy the `html` folder twice and name the two copies `html_a` and `html_b` respectively.
We will use these two folders in the `nginx` instances.
Change the text in `html_b/index.html` to "Hello World from B!" and the background color to `blue`.

A second preparation is necessary: Create a file called `nginx.conf` in your test folder and save it with the following contents.
You do not have to understand the details, but -in a nutshell- this configuration will make `nginx` work as a load balancer by forwarding requests to two servers `a` and `b`.

    # nginx.conf
    events { worker_connections 1024; }
    http {
        upstream app_servers {
            server a:80;
            server b:80;
        }
        server {
            listen 80;
            location / {
                proxy_pass http://app_servers;
            }
        }
    }

To put all the pieces together, edit the `docker-compose.yml` file and save it with the following content.

    # docker-compose.yml
    services:
      a:
        image: nginx
        volumes:
          - ./html_a:/usr/share/nginx/html/
      b:
        image: nginx
        volumes:
          - ./html_b:/usr/share/nginx/html/
      proxy:
        image: nginx
        ports:
          - 8080:80
        volumes:
          - ./nginx.conf:/etc/nginx/nginx.conf

This content defines two simple services `a` and `b` that follow the previous example: the `nginx` instances will serve the contents from mounted volumes.
The third service `proxy` is also based on the `nginx` base image.
However, it won't serve contents, instead, we will replace its configuration file to make it act like a load balancer.

Start this deployment with Docker compose.

    $ docker-compose up -d

Reloading [http://localhost:8080](http://localhost:8080) should now alternate between the red and the blue website versions of `html_a` and `html_b`.
You can further validate that indeed three containers have been started by running `docker ps -a`.
The output will contain three containers `test-a-1`, `test-b-1`, and `test-proxy-1`.

Please note that all three containers can communicate with each other without explicitly configuring their ports in the compose file, as all are located within the same Docker network.
However, access from the outside requires a port mapping, like it is done for the proxy.

To finish the exercise, run `docker-compose down` to shutdown all containers and remove all traces.
You will see that `docker ps -a` will show an empty list again.





