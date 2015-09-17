#!/bin/bash

TARGET_DIR=$1

echo "Welcome to CHIP Buildroot build $(cat build) rev $(cat buildroot_githash)" >${TARGET_DIR}/etc/issue
