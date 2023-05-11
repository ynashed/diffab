# Use an official miniconda runtime as a parent image
FROM conda/miniconda3

MAINTAINER Youssef Nashed "youssef.shady@gmail.com"

ENV PYTHONUNBUFFERED=1

ARG SCRATCH_VOLUME=/scratch
ENV SCRATCH_VOLUME=/scratch
ENV DEBIAN_FRONTEND=noninteractive
RUN echo creating ${SCRATCH_VOLUME} && mkdir -p ${SCRATCH_VOLUME}
VOLUME ${SCRATCH_VOLUME}

ADD env.yaml /work/env.yaml

RUN apt-get update && \
    apt-get install -y git wget build-essential libtool autoconf unzip libssl-dev

RUN conda env create -n diffab --file /work/env.yaml
