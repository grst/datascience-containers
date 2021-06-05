#!/bin/bash

export RSTUDIO_WHICH_R=${CONDAENV}/bin/R
export RETICULATE_PYTHON=${CONDAENV}/bin/python
# export PATH=${CONDAENV}/bin:$PATH
# export LD_LIBRARY_PATH=${CONDAENV}/lib:$LD_LIBRARY_PATH

echo rsession-which-r=${RSTUDIO_WHICH_R} > /etc/rstudio/rserver.conf
echo rsession-ld-library-path=${CONDAENV}/lib >> /etc/rstudio/rserver.conf
echo "R_LIBS_USER=${CONDAENV}/lib/R/library" > /home/rstudio/.Renviron

/init
