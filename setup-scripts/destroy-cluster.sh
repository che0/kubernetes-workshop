#!/bin/bash
set -ex
gcloud beta container --project "pokus-234611" clusters delete my-cluster --zone "us-east1-c"
