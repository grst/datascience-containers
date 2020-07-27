# Start with studio and tidyverse
FROM rocker/rstudio

SHELL [ "/bin/bash", "--login", "-c" ]

# Add miniconda
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV RSTUDIO_WHICH_R /opt/conda/bin/R
ENV RETICULATE_PYTHON /opt/conda/bin/python

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo "conda activate base" >> ~/.bashrc && \
    conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge && \
    sed -i "s#rsession-which-r=.*#rsession-which-r=/opt/conda/bin/R#g" /etc/rstudio/rserver.conf

# Hack to make podman mounts work with rootless containers. 
# MAKES RSTUDIO RUN AS ROOT - THIS IS BAD WHEN USING WITH DOCKER! 
# Background: 
# podman volumes will always be mounted as root within the container and
# have user permissions outside the container. Like that, the `rstudio` user
# cannot read/write to the mounted directory, as it is owned by root inside 
# the container. 
RUN sed -ri 's/(^rstudio:x:)([0-9]+)(:)([0-9]+)(:.+$)/\10\30\5/' /etc/passwd && \    
    echo auth-minimum-user-id=0 >> /etc/rstudio/rserver.conf
~

CMD ["/init"]
