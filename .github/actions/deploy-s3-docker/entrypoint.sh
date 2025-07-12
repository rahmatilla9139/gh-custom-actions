#!/bin/bash

BUCKET=${INPUT_BUCKET}
BUCKET_REGION=${INPUT_BUCKET_REGION}
BUILD_FOLDER=${INPUT_DIST_FOLDER}

echo ${BUCKET}
echo ${BUCKET_REGION}
echo ${BUILD_FOLDER}

aws configure list

S3URI="s3://${BUCKET}"
aws s3 sync ${BUILD_FOLDER} ${S3URI} --region ${BUCKET_REGION}

if [[ $? -eq 0 ]]; then
    URL="http://${BUCKET}.s3-website-${BUCKET_REGION}.amazonaws.com"
    echo "website-url=${URL}"
    exit 0
else
    exit 1
fi

