#!/bin/sh

NODE_VERSION=v12.14.0

NODE_DIR=node-${NODE_VERSION}
NODE_TARBALL=node-${NODE_VERSION}.tar.gz

curl https://nodejs.org/dist/${NODE_VERSION}/${NODE_TARBALL} > ${NODE_TARBALL}
tar xzf ${NODE_TARBALL}
cd ${NODE_DIR}
export CPPFLAGS=-D__STDC_FORMAT_MACROS
export LDFLAGS=-lrt
./configure
make -j`nproc`
