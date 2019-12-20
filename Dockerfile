FROM centos:centos6
LABEL maintainer="joe@rstudio.com"

RUN yum -y install centos-release-scl
RUN yum -y install python27
RUN yum -y install devtoolset-7
RUN yum -y install git
RUN yum -y install xz

COPY make-node.sh /make-node.sh

ENTRYPOINT [ "/make-node.sh" ]
