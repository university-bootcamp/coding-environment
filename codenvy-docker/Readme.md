# Codenvy Docker

This file is used to generate the image/environment on which your codenvy projects will be set up.

1. [Building the Image](#building-the-image)
2. [Running Commands](#running-commands)
3. [Pushing to Docker Hub](#pushing-to-docker-hub)
4. [Running with Codenvy](#running-with-codenvy)

## Building the Image

To build the image:

```sh
docker build . -t tteltrab/rr-pg-for-codenvy &&
```

## Running Commands

To run commands interactively in a new container using the image:

```sh
docker run -i -t tteltrab/rr-pg-for-codenvy /bin/bash
```

## Pushing to Docker Hub

Once the image has been built, push the image:

```sh
docker push tteltrab/rr-pg-for-codenvy
```

Currently this image is publicly available on docker hub here: <https://hub.docker.com/r/tteltrab/rr-pg-for-codenvy/> .

## Running with Codenvy

To run this on Codenvy, simply create a new stack with the following recipe:

```docker
FROM tteltrab/rr-pg-for-codenvy
```

Then, when creating a new workspace, choose the stack with the name used in the creation above.
