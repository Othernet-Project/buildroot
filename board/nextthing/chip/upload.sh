#!/bin/bash

BUILD_NUMBER=$1
S3_DEST=s3://opensource.nextthing.co/chip/buildroot/bugfix
S3_OPTIONS="--acl-public --no-guess-mime-type --disable-multipart"

if s3cmd put ${S3_OPTIONS} --recursive output/images ${S3_DEST}/${BUILD_NUMBER}/ |tee s3cmd_out.txt
then
  echo "${BUILD_NUMBER}" >upload_buildno
  
  s3cmd put ${S3_OPTIONS} upload_buildno ${S3_DEST}/${BUILD_NUMBER}/build 

	cat s3cmd_out.txt |grep Public |head -n1 |sed -e 's/.*http:/http:/; s/\(http:.*\/\).*\/.*/\1/' >latest
	s3cmd put ${S3_OPTIONS} latest ${S3_DEST}/latest
	
	#cat s3cmd_out.txt |grep Public |head -n1 |sed -e 's/.*http:/http:/; s/\(http:.*\/\).*\/.*/\1/' >os_latest
	#s3cmd put ${S3_OPTIONS} --add-header="x-amz-website-redirect-location:/chip/buildroot/stable/${BUILD_NUMBER}/rootfs.ubi" os_latest s3://opensource.nextthing.co/chip/buildroot/stable/latest
fi
