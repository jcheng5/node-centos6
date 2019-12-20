FROM centos:centos6
LABEL maintainer="joe@rstudio.com"

RUN yum -y install centos-release-scl
RUN yum -y install python27
RUN yum -y install devtoolset-7

COPY make-node.sh /make-node.sh

ENTRYPOINT [ "/bin/bash", "/make-node.sh" ]
