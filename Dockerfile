FROM jupyter/scipy-notebook
LABEL maintainer='Stefan Verhoeven <s.verhoeven@esciencecenter.nl'

USER root

RUN apt-get update && \ 
    cat apt.txt | xargs apt install -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

ADD environment.yml /tmp/environment.yml

RUN conda env update -n root -f /tmp/environment.yml && \
    conda clean -tipsy && \
    jupyter labextension install --no-build jupyter-leaflet && \
    jupyter labextension install --no-build @pyviz/jupyterlab_holoviews && \
    jupyter labextension install jupyter-matplotlib && \
    rm -rf $CONDA_DIR/share/jupyter/lab/staging && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    rm -rf /home/$NB_USER/.node-gyp && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
