#!/bin/bash

# halt on any error
set -e

# Set project
gcloud config set project exac-gnomad

# Create the replication controller
kubectl create -f deploy/config/mongo-service.yaml
kubectl create -f deploy/config/mongo-controller.yaml

# Wait for mongo to initialize
sleep 120

# load data
kubectl create -f deploy/config/gnomad-precalculate-pod.json