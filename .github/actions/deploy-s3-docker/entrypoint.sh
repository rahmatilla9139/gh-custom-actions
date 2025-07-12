#!/bin/bash

BUCKET=${INPUT_BUCKET}
BUCKET_REGION=${INPUT_BUCKET_REGION}
BUILD_FOLDER=${INPUT_DIST_FOLDER}

aws configure list

S3URI="s3://${BUCKET}"
aws s3 sync ${BUILD_FOLDER} ${S3URI} --region ${BUCKET_REGION}
URL="http://${BUCKET}.s3-website-${BUCKET_REGION}.amazonaws.com"

echo "website-url=${URL}"
