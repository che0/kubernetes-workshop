#!/bin/bash
set -ex

# Podle https://docs.cert-manager.io/en/latest/getting-started/install.html 
# * upraveno na fixni verzi 0.7.0 (deploy s https://raw.githubusercontent.com/jetstack/cert-manager/release-0.7/deploy/manifests/cert-manager.yaml jeste nemel image)
# * bez validacniho webhooku (mame privatni GKE cluster)

kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
kubectl apply \
    -f https://raw.githubusercontent.com/jetstack/cert-manager/v0.7.0/deploy/manifests/cert-manager-no-webhook.yaml \
    --validate=false
