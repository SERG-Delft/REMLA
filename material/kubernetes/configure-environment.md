---
layout: page
title: Configure Environment
parent: Kubernetes
grand_parent: Material
nav_order: 4
---

# {{page.title}}

In any serious deployment, configuration data has to be passed into a container and often it is necessary to access file-storage.
This exercise introduces examples for how to achieve both.
Create a new file `environment.yml` for this exercise.

## Provide Configuration in Environment Variables

Configuration options are usually passed into containers via environment variables.
Two alternatives exist for how to achieve this, [ConfigMap][k8s-configmap] and [Secret][k8s-secret].

[k8s-configmap]: https://kubernetes.io/docs/concepts/configuration/configmap/
[k8s-secret]: https://kubernetes.io/docs/concepts/configuration/secret/

#### Define ConfigMap

Copy the first example of a _ConfigMap_ from the documentation and add it to your `environment.yml` file.
Our _ConfigMap_ only contains the one field `user`, however, note that the `data` field is a key/value store and can contain arbitrary data in YAML format.

```yml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-configmap
data:
  user: John Doe
```

#### Define Secret

A _Secret_ is defined in the same way as a _ConfigMap_, however, values are not stored as plaintext, but need to be Base64 encoded.
This can be easily achieved on the terminal, just make sure that you _include_ the `-n` parameter to suppress a trailing newline character from being added.

    $ echo -n bar | base64
    YmFy
    $ echo bar | base64
    YmFyCg==

Apart from the encoding, the definition of a _Secret_ is then very similar to a _ConfigMap_.

```yml
apiVersion: v1
kind: Secret
metadata:
  name: my-secret
data:
  foo: YmFy
```

Add both the _ConfigMap_ and the _Secret_ to the `environment.yml` file and do not forget to add the separator `---`.
Apply the file to the cluster.

    $ kubectl apply -f environment.yml
    configmap/my-configmap created
    secret/my-secret created

Open the Minikube dashboard, find both resources, and explore their contents.

#### Add ConfigMap and Secret to a Pod

We define a simple _Pod_ that is using the `showenv` image to make it easy to investigate the defined environment variables.
Append the _Pod_ definition to the `environment.yml` file.

```yml

---
apiVersion: v1
kind: Pod
metadata:
  name: showenv
spec:
  containers:
    - name: showenv
      image: proksch/showenv
      ports:
        - containerPort: 8080
      env:
        - name: USERNAME
          valueFrom:
            configMapKeyRef:
              name: my-configmap
              key: user
        - name: FOO
          valueFrom:
            secretKeyRef:
              name: my-secret
              key: foo
```

Please note that the name of the environment variable can differ from the key that is used in the _ConfigMap_ or _Secret_.
Apply the `environment.yml` file to your cluster and start a port-forward that makes it possible to connect to the _Pod_.

    $ kubectl apply -f environment.yml
    configmap/my-configmap unchanged
    secret/my-secret unchanged
    pod/showenv created
    $ kubectl port-forward showenv 1234:8080

Opening [localhost:1234](http://localhost:1234/) in your browser will show that you both declared enviroment variables exist (`FOO: bar` and `USERNAME: John Doe`).
A containerized application can now access the provided information in the same way it would access any other environment variable.

{:.info}
Instead of providing information through the environment, you can also define that information from _ConfigMaps_ and _Secrets_ [is mounted into the file system][k8s-secretmounts].
In essence, every _key_ will then be mapped to a file and its _value_ will be the file content.

[k8s-secretmounts]: https://kubernetes.io/docs/concepts/configuration/secret/#use-case-dotfiles-in-a-secret-volume

## Use a Volume for Storage

Similar to Docker, Kubernetes has the concept of _Volumes_ that can be mounted into containers.
Unlike Docker, however, Kubernetes has a much richer selection of possible _Volume_ types.
While Docker was mostly limited to local mount options, skimming the Kubernetes documentation on [Volumes][k8s-volumes] will show you various non-local mount options, like storage via NFS or iSCSI.
For this exercise, we will use the simplest example though, a _host path_.

[k8s-volumes]: https://kubernetes.io/docs/concepts/storage/volumes/

Edit the _Pod_ in your `environment.yml` file and append the _Volume_-related configuration.
The idea is to map the host path `/data_outside` into the container file system `/data_inside`.

```yml
...
spec:
  containers:
  - name: showenv
    ...
    volumeMounts:
      - mountPath: /data_inside/
        name: my-volume
  volumes:
    - name: my-volume
      hostPath:
        path: /data_outside/

```

If you try to simply apply the changed file, Kubernetes will complain that changes cannot be merged with the existing config.
To solve this error, delete the config, before applying it again.

    $ kubectl delete -f environment.yml
    configmap "my-configmap" deleted
    secret "my-secret" deleted
    pod "showenv" deleted
    $ kubectl apply -f environment.yml
    configmap/my-configmap created
    secret/my-secret created
    pod/showenv created

To verify a working volume, create a file in `/data_inside` and restart the _Pod_.
The file will still exist.

    $ kubectl exec -it showenv -- touch /data_inside/i_was_here
    $ kubectl delete -f environment.yml
    ...
    $ kubectl apply -f environment.yml
    ...
    $ kubectl exec -it showenv -- ls /data_inside/
    i_was_here

You might wonder which host folder is actually mounted on your host.
The answer is _none_.
This is again caused by the level of abstraction that Minikube adds.
If you want to see the host path, you need to connect to the Minikube node:

    $ minikube ssh
    (container) $ ls /data_outside
    i_was_here

To finish the exercise, delete the resources from the cluster (`kubectl delete -f environment.yml`).
