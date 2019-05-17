FROM ubuntu:18.04
MAINTAINER Laurent Modolo

ENV PACKAGES curl openjdk-8-jre git

RUN apt update && \
    apt install -y ${PACKAGES}

RUN wget -qO- https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh | bash <<EOF

yes

EOF

RUN source .bashrc &&\
conda config --add channels defaults &&\
conda config --add channels bioconda &&\
conda config --add channels conda-forge &&\
conda create --yes --name bowtie2 bowtie2=2.3.4.1

RUN wget -qO- https://get.nextflow.io | bash

RUN groupadd -r leaf && \
useradd --no-log-init -r -g leaf leaf && \
chmod o+rx -R /root/

RUN su leaf &&\
source .bashrc
cd &&\
wget -qO- https://get.nextflow.io | bash &&
git clone https://github.com/l-modolo/nf_conda_

