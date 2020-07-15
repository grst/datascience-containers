# datascience-containers
Personal docker base images

### Run rstudio using podman
```bash
podman run -it --rm --ulimit="nofile=4096" --env PASSWORD=bioc -p 8788:8787 --name rocker docker.io/rocker/rstudio
```
