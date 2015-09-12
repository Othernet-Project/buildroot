#!/bin/bash

s3cmd put --acl-public --no-guess-mime-type --recursive output/images s3://stak-images/firmware/chip/stable/${BUILD_NUMBER}/ |tee s3cmd_out.txt
cat s3cmd_out.txt |grep Public |head -n1 |sed -e 's/.*http:/http:/; s/\(http:.*\/\).*\/.*/\1/' >latest
s3cmd put --acl-public --no-guess-mime-type latest s3://stak-images/firmware/chip/stable/latest

