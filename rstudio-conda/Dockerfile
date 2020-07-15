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

CMD ["/init"]
