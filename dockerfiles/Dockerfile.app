FROM aidence-sys:latest

# Install python deps
RUN pip3 install \
        jupyter \
        numpy \
        opencv-contrib-python \
        PyYAML \
        && \
    pip3 install \
        pandas \
        pycuda \
        dicom \
        scikit-learn \
        scipy==0.17.0 \
        SimpleITK \
        tensorflow-gpu==1.1

# Clone repo, remove .git directory
RUN git clone https://bitbucket.org/aidence/kaggle-data-science-bowl-2017.git ./code && \
    rm -r ./code/.git

WORKDIR "/root"
CMD ["jupyter", "notebook", "--ip=*", "--allow-root"]
EXPOSE 8888
