# Start with jupyter notebook 
FROM jupyter/scipy-notebook

# Install python packages and jupyterlab extensions
RUN conda install -c conda-forge -c bioconda --quiet --yes -n base \
	jupytext \
	altair \
	black \
	jupyterlab_code_formatter \
	pandoc \ 
	nextflow \
    && \
    pip install reportsrender && \
    jupyter labextension install @ryantam626/jupyterlab_code_formatter && \
    jupyter serverextension enable --py jupyterlab_code_formatter && \
    jupyter lab build 

RUN conda install --quiet --yes \
    'r-base=3.6.2' \
    'r-caret=6.0*' \
    'r-crayon=1.3*' \
    'r-devtools=2.2*' \
    'r-forecast=8.10*' \
    'r-hexbin=1.28*' \
    'r-htmltools=0.4*' \
    'r-htmlwidgets=1.5*' \
    'r-irkernel=1.1*' \
    'r-nycflights13=1.0*' \
    'r-plyr=1.8*' \
    'r-randomforest=4.6*' \
    'r-rcurl=1.98*' \
    'r-reshape2=1.4*' \
    'r-rmarkdown=2.1*' \
    'r-rsqlite=2.1*' \
    'r-shiny=1.3*' \
    'r-tidyverse=1.3*' \
    'rpy2=3.1*' \
    'r-conflicted' \ 
    'r-pheatmap' \
    'r-ggpubr' \
    'r-cowplot' \ 
    'r-reticulate' \
    'r-conflicted' \ 
    'r-pheatmap' \
    'r-ggpubr' \
    'r-cowplot' \ 
    'r-reticulate' \
    && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
