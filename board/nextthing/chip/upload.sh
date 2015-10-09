#!/bin/bash

BUILD_NUMBER=$1
S3_DEST=s3://opensource.nextthing.co/chip/buildroot/bugfix

if s3cmd put --acl-public --no-guess-mime-type --recursive output/images ${S3_DEST}/${BUILD_NUMBER}/ |tee s3cmd_out.txt
then
  echo "${BUILD_NUMBER}" >upload_buildno
  
  s3cmd put --acl-public --no-guess-mime-type upload_buildno ${S3_DEST}/${BUILD_NUMBER}/build 

	cat s3cmd_out.txt |grep Public |head -n1 |sed -e 's/.*http:/http:/; s/\(http:.*\/\).*\/.*/\1/' >latest
	s3cmd put --acl-public --no-guess-mime-type latest ${S3_DEST}/latest
	
	#cat s3cmd_out.txt |grep Public |head -n1 |sed -e 's/.*http:/http:/; s/\(http:.*\/\).*\/.*/\1/' >os_latest
	#s3cmd put --acl-public --no-guess-mime-type --add-header="x-amz-website-redirect-location:/chip/buildroot/stable/${BUILD_NUMBER}/rootfs.ubi" os_latest s3://opensource.nextthing.co/chip/buildroot/stable/latest
fi
