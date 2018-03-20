FROM nvidia/cuda:9.1-cudnn7-devel

ENV DEBIAN_FRONTEND noninteractive

# Update existing packages
RUN apt update && apt -y upgrade && \
	apt clean && \
	apt autoremove && \
	rm -rf /var/lib/apt/lists/*

# Install base deps
RUN apt update && apt install -y \
        build-essential \
        curl \
        git \
        libffi-dev \
        libssl-dev \
        wget \
        && \
	apt clean && \
	apt autoremove && \
	rm -rf /var/lib/apt/lists/*

# Install python
RUN apt update && apt install -y \
        python3 \
        python3-dev \
        && \
	apt clean && \
	apt autoremove && \
	rm -rf /var/lib/apt/lists/*

# Install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python3 get-pip.py && \
	rm get-pip.py

# Install python deps
RUN pip3 install \
        numpy \
        opencv-contrib-python \
        pandas \
        pycuda \
        pydicom \
        PyYAML \
        scikit-learn \
        scipy \
        SimpleITK \
        tensorflow

WORKDIR "/root"
CMD ["/bin/bash"]
