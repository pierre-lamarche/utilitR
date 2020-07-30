# see the original Dockerfile at https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/Dockerfile_binder_4.0.2
FROM registry.gitlab.com/linogaliana/documentationr:master

ENV NB_USER=jovyan

RUN /rocker_scripts/install_python.sh
RUN /rocker_scripts/install_binder.sh

CMD jupyter notebook --ip 0.0.0.0

USER ${NB_USER}

WORKDIR /home/${NB_USER}

## Copy files into the Docker image
# Copy Rprofile to /home/rstudio/.Rprofile
COPY --chown=${NB_USER}:${NB_USER} Rprofile ${WORKDIR}/.Rprofile

# Clone project
RUN git clone https://gitlab.com/linogaliana/documentationr.git ${WORKDIR}/documentationR
