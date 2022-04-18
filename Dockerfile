FROM nvcr.io/nvidia/nvhpc:21.3-devel-cuda_multi-ubuntu20.04

RUN apt-get -y update && \
        DEBIAN_FRONTEND=noninteractive apt-get -yq install --no-install-recommends python3-pip python3-setuptools nginx zip make build-essential libtbb-dev && \
        rm -rf /var/lib/apt/lists/* && \
        pip3 install --upgrade pip &&\
        pip3 install gdown
        
RUN apt-get update -y        
RUN apt-get install -y git nvidia-modprobe
RUN pip3 install jupyterlab
# Install required python packages
RUN pip3 install ipywidgets
CMD jupyter-lab --no-browser --allow-root --ip=0.0.0.0 --port=8888 --NotebookApp.token="" --notebook-dir=/labs
