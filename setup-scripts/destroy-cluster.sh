#!/bin/bash
[ -n "${GCP_PROJECT}" ] || { echo 'Missing $GCP_PROJECT'; exit 1; }
set -ex
gcloud beta container --project "${GCP_PROJECT}" clusters delete my-cluster --zone "us-east1-c"
