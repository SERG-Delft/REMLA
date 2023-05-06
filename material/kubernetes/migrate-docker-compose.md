---
layout: page
title: Migrate Docker Compose
parent: Kubernetes
grand_parent: Material
nav_order: 5
---

# {{page.title}}

Creating a Kubernetes configuration of the project of last year is a perfect opportunity to practice todays lecture contents.

## Migrate a Docker Compose to Kubernetes

Last year, the project was based on a classifier for detecting [SMS Spam][sms-app].
The project consisted of a backend service that wrapped an ML model in a webservice and a frontend application that added a (trivial) user interface to make it usable.

[sms-app]: {%link material/projects/sms-spam.md%}

#### Docker Compose

The architecture of the application is simple and the released containers can be deployed with a short Docker compose file.

```yml
# docker-compose.yml
services:
  model:
    image: "proksch/sms-spam-detection"
  web:
    image: "proksch/myweb"
    ports:
     - "8080:8080"
    environment:
     - MODEL_HOST=http://model:8080
```

Once this configuration is deployed, there are two interesting pages to visit:

- [localhost:8080/](http://localhost:8080/): A status page that provides information about the container.
- [localhost:8080/sms/](http://localhost:8080/sms/): A frontend that allows to check whether SMS messages are Spam.


#### Migration Challenge

Convert this running example from Docker compose to Kubernetes.
You can reuse the old images `proksch/sms-spam-detection` and `proksch/myweb`.

You need to perform several steps:

- Create a *Deployment* and a *Service* for `proksch/sms-spam-detection`.
- Create a *Deployment* and a *Service* for `proksch/myweb`.
- Create a *ConfigMap* and introduce the required environment variables in the `myweb` deployment.
- Create an *Ingress* for the application.


## Solution

{:.info}
We strongly recommend not to copy this solution blindly.
Check first whether you can perform the migration yourself.
You have learned all the requirements in the previous exercise steps.

The two links provided before should work in the same way, when the following configuration is applied to your cluster.
Please note that the download of the containers and the initial statup might take some time.
If you receive an error, check the progress in the Minikube dashboard.

```yml
# sms.yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sms-model-depl
  labels:
    app: sms-model
spec:
  replicas: 3
  selector:
    matchLabels:
      app: sms-model
  template:
    metadata:
      labels:
        app: sms-model
    spec:
      containers:
      - name: sms-model
        image: proksch/sms-spam-detection
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: sms-model-serv
spec:
  selector:
    app: sms-model
  ports:
    - port: 8080
      targetPort: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sms-web-depl
  labels:
    app: sms-web
spec:
  replicas: 1
  selector:
    matchLabels:
      app: sms-web
  template:
    metadata:
      labels:
        app: sms-web
    spec:
      containers:
      - name: sms-web
        image: proksch/myweb
        ports:
        - containerPort: 8080
        env:
          - name: MODEL_HOST
            valueFrom:
              configMapKeyRef:
                name: my-config
                key: model.host
---
apiVersion: v1
kind: Service
metadata:
  name: sms-web-serv
spec:
  selector:
    app: sms-web
  ports:
    - port: 8080
      targetPort: 8080
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
spec:
  defaultBackend:
    service:
      name: sms-web-serv
      port:
        number: 8080
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-config
data:
  model.host: "http://sms-model-serv:8080"
```

