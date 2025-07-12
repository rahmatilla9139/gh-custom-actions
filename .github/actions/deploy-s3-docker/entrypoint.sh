#!/bin/bash

BUCKET=$1
BUCKET_REGION=$2
BUILD_FOLDER=$3

aws configure list

S3URI="s3://${BUCKET}"
aws s3 sync ${BUILD_FOLDER} ${S3URI} --region ${BUCKET_REGION}

if [[ $? -eq 0 ]]; then
    URL="http://${BUCKET}.s3-website-${BUCKET_REGION}.amazonaws.com"
    echo "website-url=${URL}" >> ${GITHUB_OUTPUT}
    exit 0
else
    exit 1
fi

