# Use an official anaconda runtime as a parent image
FROM continuumio/anaconda3

LABEL maintainer="Youssef Nashed youssef.shady@gmail.com"

ENV PYTHONUNBUFFERED=1

ARG SCRATCH_VOLUME=/scratch
ENV SCRATCH_VOLUME=/scratch
ENV DEBIAN_FRONTEND=noninteractive
RUN echo creating ${SCRATCH_VOLUME} && mkdir -p ${SCRATCH_VOLUME}
VOLUME ${SCRATCH_VOLUME}

WORKDIR /work
ADD . /work

RUN conda env create -n diffab --file env.yaml

RUN chmod +x scripts/run.sh
ENTRYPOINT ["/work/scripts/run.sh"]
