# Use an official pytorch runtime as a parent image
FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

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

RUN conda-env create -f env.yaml -n diffab
