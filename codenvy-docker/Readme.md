# Codenvy Docker

This file is used to generate the image/environment on which your codenvy projects will be set up.

## Docker Hub Repo

Currently this image is publicly available on docker hub here: <https://hub.docker.com/r/tteltrab/rr-pg-for-codenvy/> .

To build and push this image, the following commands were used:

```sh
docker build . -t tteltrab/rr-pg-for-codenvy &&
docker push tteltrab/rr-pg-for-codenvy
```

## Running with Codenvy

To run this on codenvy, simply create a new stack with the following recipe:

```docker
FROM tteltrab/rr-pg-for-codenvy
```

Then, when creating a new workspace, choose the stack with the name used in the creation above.
