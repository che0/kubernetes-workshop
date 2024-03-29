#!/bin/bash
[ -n "${GCP_PROJECT}" ] || { echo 'Missing $GCP_PROJECT'; exit 1; }
set -ex
gcloud beta container --project "${GCP_PROJECT}" \
    clusters create "my-cluster" \
        --zone "us-east1-c" \
        --no-enable-basic-auth \
        --cluster-version "1.12.7-gke.7" \
        --machine-type "g1-small" \
        --image-type "COS" \
        --disk-type "pd-standard" \
        --disk-size "20" \
        --metadata disable-legacy-endpoints=true \
        --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" \
        --num-nodes "3" \
        --enable-cloud-logging \
        --enable-cloud-monitoring \
        --enable-private-nodes \
        --master-ipv4-cidr "172.16.78.0/28" \
        --enable-master-authorized-networks --master-authorized-networks=0.0.0.0/0 \
        --enable-ip-alias \
        --network "projects/${GCP_PROJECT}/global/networks/default" \
        --subnetwork "projects/${GCP_PROJECT}/regions/us-east1/subnetworks/default" \
        --default-max-pods-per-node "110" \
        --addons HorizontalPodAutoscaling,HttpLoadBalancing \
        --no-issue-client-certificate \
        --enable-autoupgrade --enable-autorepair
