#!/bin/bash
set -ex
gcloud compute --project=pokus-234611 addresses create my-static-address --global --network-tier=PREMIUM
gcloud compute --project=pokus-234611 addresses describe my-static-address --global | grep ^address
