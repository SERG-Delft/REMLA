---
layout: page
title: Automate the Release
parent: Deployment with GitHub
grand_parent: Material
nav_order: 3
---

# {{page.title}}

You have already taken the necessary steps to containerize a microservice application.
However, the release of the container has been manual so far, which is error-prone.
In this exercise, we will create a workflow to automate this step and learn how to use release tags to automate the versioning.


## Create a Secret in the Repository

Open the settings of your `YOURNAME/test-remla` repository on GitHub.
In your settings, open the page for Security » Secrets and Variables » Actions.
Now, add a *New repository secret* with the name `GH_TOKEN` and add your PAT as the content.


## Create Workflow

In your local checkout of the `YOURNAME/test-remla` repository, create a file to define a new workflow:
Create the file `.github/workflows/release.yml` with the following content:

```yml
name: Release
on: push
jobs:
  build:
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v3
      - name: Registry Login (ghcr.io)
        run: echo "${%raw%}{{{%endraw%} secrets.GH_TOKEN }}" | docker login ghcr.io -u ${{ github.actor }} --password-stdin
      - name: Build and Push Docker Image
        run: |
          IMG=ghcr.io/${%raw%}{{{%endraw%} github.repository }}
          docker build --tag $IMG:latest .
          docker push --all-tags $IMG
```

The workflow runs on every push to the repository and will take care of the following tasks:

- Checkout the repository.
- Log into the GitHub container registry with the secret from before.
- Build, tag, and push an image. It will always use the `:latest` version.

The execution of the workflow can be observed in the GitHub repository in the *Actions* tab.
Opening the started workflows give access to the buidl logs, which makes it easy to debug failing builds.

Authentication seems to be inconsistent between organizational repositories and personal repositories of users.
While a user repository must use a secret, it seems that organizations can just use `${%raw%}{{{%endraw%} github.token }}` for login.
This simplification does not work for personal user repositories.

## Automate Versioning

It is a good practice to version releases with semantic versioning, so your users can understand the nature of an update.
The goal is to make versioning as convenient as possible by taking the version information from the environment.

GitHub uses release tags of the form `v1.2.3` to mark releases in the commit history.
We will extend the workflow and use this information for the image releases.
Open the workflow file again and perform the following changes.

1) Update the trigger to only react to pushed tags with a specific format (i.e., `v1.2.3`).

```yml
# only trigger on tags, `verify` has already been triggered by push to PR
on:
  push:
    tags: ["v[0-9]+.[0-9]+.[0-9]+"]
```
2) Add a new step after the `checkout` step to extract the release tag, parse the different semantic parts, and store it in the GitHub environment.

```yml
      - name: Parse version info from tag
        run: |
          # GITHUB_REF is like refs/tags/v2.3.5, so strip the first 11 chars
          VERSION=${GITHUB_REF:11}
          MAJOR=`echo "$VERSION" | cut -d . -f 1`
          MINOR=`echo "$VERSION" | cut -d . -f 2`
          PATCH=`echo "$VERSION" | cut -d . -f 3`
          echo "version=$VERSION" >> $GITHUB_ENV
          echo "version_major=$MAJOR" >> $GITHUB_ENV
          echo "version_minor=$MINOR" >> $GITHUB_ENV
          echo "version_patch=$PATCH" >> $GITHUB_ENV
```

3) Update the image creation step and use the semantic version from the GitHub environment to build and push four distinct tags:
`1.2.3`, `1.2.latest`, `1.latest`, and `latest`.

```yml
      - name: Build and Push Docker Image
        run: |
          IMG=ghcr.io/${%raw%}{{{%endraw%} github.repository }}
          docker build \
            --tag $IMG:${%raw%}{{{%endraw%} env.version }} \
            --tag $IMG:${%raw%}{{{%endraw%} env.version_major }}.${%raw%}{{{%endraw%} env.version_minor }}.latest \
            --tag $IMG:${%raw%}{{{%endraw%} env.version_major }}.latest \
            --tag $IMG:latest \
            .
          docker push --all-tags $IMG
```

Commit and push the updated workflow file.
Then push a tag like `v0.0.1` to the repository.

    $ git add -A
    $ git commit -m "Updated workflow"
    $ git push
    $ git tag v0.0.1
    $ git push origin v0.0.1

Open your repository in the browser and observe the build log in the "Actions" tab.
On completion, you can ensure that the new image has been registered in the container registry (i.e., `https://ghcr.io/YOURNAME/remla-test:0.0.1`).




