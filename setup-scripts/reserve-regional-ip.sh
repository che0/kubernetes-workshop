#!/bin/bash
set -ex
gcloud compute --project=pokus-234611 addresses create my-static-address --region=us-east1 --network-tier=PREMIUM
gcloud compute --project=pokus-234611 addresses describe my-static-address --region=us-east1 | grep ^address
