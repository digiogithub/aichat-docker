# aichat docker image

This is a docker image for the aichat project https://github.com/sigoden/aichat 

## Tasks

### build

Build the image

interactive: true
env: GIT_BRANCH=v0.23.0

```bash
VERSION=$(date +%Y%m%d%H%M%S)
docker build -t aichat -t digiosysops/aichat:latest -t digiosysops/aichat:$VERSION .
```

### push

Push the image to the registry

interactive: true

```bash
docker push digiosysops/aichat:latest
# find the last version tag different from latest
VERSION=$(docker images | grep digiosysops/aichat | grep -v latest | awk '{print $2}' | head -n 1)
docker push digiosysops/aichat:$VERSION
```

### run

Runs the aichat image

interactive: true

```bash
docker run -v $HOME/.config/aichat/config.yaml:/root/.config/aichat/config.yaml --rm -p 8000:8000 aichat
```