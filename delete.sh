#!/usr/bin/env bash
set -euo pipefail

ENV="${1:-dev}"
REGION="${2:-ap-south-1}"
STACK_NET="udagram-network-${ENV}"
STACK_APP="udagram-app-${ENV}"

echo ">>> Deleting app stack: udagram-stack"
aws cloudformation delete-stack --stack-name "udagram-stack" --region "us-east-1"
aws cloudformation wait stack-delete-complete --stack-name "udagram-stack" --region "us-east-1" || true

echo ">>> Deleting network stack: networkstack"
aws cloudformation delete-stack --stack-name "networkstack" --region "us-east-1"
aws cloudformation wait stack-delete-complete --stack-name "networkstack" --region "us-east-1" || true

echo "All stacks deleted for env: $ENV"
