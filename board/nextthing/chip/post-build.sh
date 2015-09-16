#!/bin/bash

TARGET_DIR=$1

echo "ttyGS0::respawn:/sbin/getty -L ttyGS0 115200 vt100 # gadget serial" >>${TARGET_DIR}/etc/inittab

echo "Welcome to CHIP Buildroot build $(cat build) rev $(cat buildroot_githash)" >${TARGET_DIR}/etc/issue
