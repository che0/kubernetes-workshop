#!/bin/bash
set -ex
gcloud compute --project=pokus-234611 addresses delete my-static-address --global
