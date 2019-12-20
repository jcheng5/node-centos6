FROM centos:centos6
LABEL maintainer="joe@rstudio.com"

RUN yum -y install centos-release-scl
RUN yum -y install python27
RUN yum -y install devtoolset-7

SHELL [ "/usr/bin/scl", "enable", "devtoolset-7", "python27" ]
