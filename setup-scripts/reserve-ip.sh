#!/bin/bash
set -ex
gcloud compute --project=pokus-234611 addresses create my-static-address --global --network-tier=PREMIUM