FROM ubuntu:18.04
MAINTAINER Laurent Modolo

ENV PACKAGES wget openjdk-8-jre git

RUN apt update && \
    apt install -y ${PACKAGES}

RUN git clone https://github.com/l-modolo/nf_conda_bugreport.git && \
bash nf_conda_bugreport/conda_install.sh

ENV PATH="/root/miniconda3/bin:$PATH"

RUN conda config --add channels defaults && \
conda config --add channels bioconda && \
conda config --add channels conda-forge && \
conda create --yes --name bowtie2 bowtie2=2.3.4.1

RUN groupadd -r leaf && \
useradd --no-log-init -r -g leaf leaf && \
chmod o+rx -R /root/ && \
mkdir -p /home/leaf/ && \
chown leaf -R /home/leaf && \
cp /root/.bashrc /home/leaf/

RUN wget -qO- https://get.nextflow.io | bash && \
mv nextflow /usr/bin/ && \
chmod o+rx /usr/bin/nextflow

RUN su leaf && cd && nextflow


USER leaf

WORKDIR /home/leaf

