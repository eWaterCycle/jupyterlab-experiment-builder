Jupyter Lab Docker image with eWaterCycle dependencies installed.

# Usage

Using https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook

```
docker build -t ewatercycle/experiment-builder .
docker run -it --rm -p 8888:8888 ewatercycle/notebook
```
