#!/bin/bash
[ -n "${GCP_PROJECT}" ] || { echo 'Missing $GCP_PROJECT'; exit 1; }
set -ex
gcloud compute --project=${GCP_PROJECT} addresses delete my-static-address --global
