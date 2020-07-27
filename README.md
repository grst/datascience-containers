# datascience-containers
Personal docker base images

## rstudio-conda

Based on `rocker/rstudio`. An rstudio installation using 
R from conda. This makes it easy to install packages 
using conda which versioned and a lot faster than compiling them
from scratch. 

### build the container

The `--format docker` is required to set-up the bash shell. 
conda will not work with `sh`. 

```bash
podman build --format docker . -t grst/rtudio-conda:latest
```

### Run rstudio using podman
```bash
podman run -it --rm --ulimit="nofile=4096" \
  --env PASSWORD=notsafe -p 8788:8787 \
  --name rstudio-conda docker.io/grst/rstudio-conda
```
