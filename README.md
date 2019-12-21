# Node.js 12+ binaries for CentOS 6

The official Node.js Linux x64 binaries don't support CentOS 6 and earlier; they're now built on CentOS 7 and depend on a more recent glibc.

More details here: https://github.com/nodejs/node/issues/30077

We can successfully compile on CentOS 6 by using `scl enable python27 devtoolset-7` and setting `CPPFLAGS=-D__STDC_FORMAT_MACROS` and `LDFLAGS=-lrt`.

This repository semi-automates these builds using GitHub Actions, and publishes the resulting binaries as attachments to [releases](https://github.com/jcheng5/node-centos6/releases).

As currently written, new builds are created by editing the `NODE_VERSION` value in `.github/workflows/ci.yml`, and pushing that change to the master branch. If a release of that version doesn't already exist, then a build and publish will be attempted. (In the future, it would be nice if this workflow ran on a scheduled basis and just built whatever new Node.js it found.)
