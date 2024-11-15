# aichat docker image

This is a docker image for the aichat project https://github.com/sigoden/aichat 

## Tasks

### build

Build the image

interactive: true
env: GIT_BRANCH=v0.23.0

```bash
docker build -t aichat .
```

### run

Runs the aichat image

interactive: true

```bash
docker run --rm -p 8000:8000 aichat
```