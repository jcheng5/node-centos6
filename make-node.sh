#!/bin/sh

set -e
set -x

NODE_VERSION=$1

NODE_DIR=node-${NODE_VERSION}
NODE_TARBALL=node-${NODE_VERSION}.tar.gz

cd ${GITHUB_WORKSPACE}
curl https://nodejs.org/dist/${NODE_VERSION}/${NODE_TARBALL} > ${NODE_TARBALL}
tar xzf ${NODE_TARBALL}
cd ${NODE_DIR}

# These flags are required for CentOS 6, and are the whole
# reason for doing our own builds
export CPPFLAGS=-D__STDC_FORMAT_MACROS
export LDFLAGS=-lrt

scl enable devtoolset-7 python27 ./configure
scl enable devtoolset-7 python27 "ARCH=x64 make -j$(nproc) binary"
sha256sum node-${NODE_VERSION}-linux-x64.tar.xz node-${NODE_VERSION}-linux-x64.tar.gz > SHASUMS256.txt
