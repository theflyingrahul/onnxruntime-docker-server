FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

# Set the working directory within the container
WORKDIR /models

RUN mkdir -p /models/cuda

RUN apt update -y
RUN apt upgrade -y
RUN apt install python3 python3-pip python-is-python3 curl -y
RUN pip install numpy

# Install onnxruntime generate() API for CUDA
RUN pip install --pre onnxruntime-genai-cuda --index-url=https://aiinfra.pkgs.visualstudio.com/PublicPackages/_packaging/onnxruntime-genai/pypi/simple/

RUN curl https://raw.githubusercontent.com/microsoft/onnxruntime-genai/main/examples/python/phi3-qa.py -o phi3-qa.py
RUN nvidia-smi
# RUN python phi3-qa.py -m cuda/cuda-int4-rtn-block-32