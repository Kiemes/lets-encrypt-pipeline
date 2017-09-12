FROM ubuntu:16.04

RUN apt-get update; \
    apt-get -y upgrade; \
    apt-get -y install \
    locales \
    apt-utils groff-base \
    curl wget tar make uuid-runtime \
    build-essential checkinstall \
    libreadline-gplv2-dev libncursesw5-dev libssl-dev tk-dev libgdbm-dev libc6-dev libbz2-dev \
    libyaml-dev jq; \
    apt-get clean

RUN locale-gen en_US.UTF-8
#RUN dpkg-reconfigure locales
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# install python from source
RUN CURRENT=$PWD && \
    cd /usr/src && \
    wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tgz &&\
    tar xzf Python-2.7.12.tgz && \
    cd Python-2.7.12 && \
    ./configure && \
    make install && \
    cd $CURRENT

RUN python -m ensurepip && pip install --upgrade pip
RUN pip install awscli && pip install certbot