#!/bin/bash

export GITLAB_TOKEN=$GITLAB_TOKEN
export FLUX_CLUSTER_NAME=$FLUX_CLUSTER_NAME
export FLUX_CUSTOM_CLUSTER_SUFFIX=$FLUX_CUSTOM_CLUSTER_SUFFIX
export FLUX_CLUSTER_DOMAIN=$FLUX_CLUSTER_DOMAIN

flux bootstrap gitlab --owner=flux-nuc-poc --repository=flux-config --branch=main --path=clusters/my-cluster_${FLUX_CLUSTER_NAME}_${FLUX_CUSTOM_CLUSTER_SUFFIX} --token-auth --verbose --cluster-domain=$FLUX_CLUSTER_DOMAIN --kubeconfig=$HOME/.kube/config