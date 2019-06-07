#!/bin/bash
[ -n "${GCP_PROJECT}" ] || { echo 'Missing $GCP_PROJECT'; exit 1; }
set -ex
gcloud compute --project=${GCP_PROJECT} addresses create my-static-address --global --network-tier=PREMIUM
gcloud compute --project=${GCP_PROJECT} addresses describe my-static-address --global | grep ^address
