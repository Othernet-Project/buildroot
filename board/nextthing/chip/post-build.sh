#!/bin/bash

TARGET_DIR=$1

BUILDROOT_GITHASH="$(cat buildroot_githash)"
BUILDROOT_GITHASH="${BUILDROOT_GITHASH:0:8}"

BUILD="$(cat build)"

cat <<EOF >${TARGET_DIR}/etc/issue
Welcome to CHIP Buildroot build ${BUILD} rev ${BUILDROOT_GITHASH}

CHIP Buildroot contains various open source software.

The source code can be downloaded from:
http://opensource.nextthing.co/chip/buildroot/stable/${BUILD}/build${BUILD}.tar.gz

EOF
