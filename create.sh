echo "Creating NETWORK stack: networkstack"
aws cloudformation create-stack \
  --stack-name networkstack \
  --template-body file://network.yaml \
  --parameters file://network-parameters.json \
  --capabilities CAPABILITY_NAMED_IAM

echo "Waiting for NETWORK stack to complete..."
aws cloudformation wait stack-create-complete --stack-name networkstack

echo "Creating APPLICATION stack: udagram-stack"
aws cloudformation create-stack \
  --stack-name udagram-stack \
  --template-body file://udagram.yaml \
  --parameters file://udagram-parameters.json \
  --capabilities CAPABILITY_NAMED_IAM

echo "Waiting for APPLICATION stack to complete..."
aws cloudformation wait stack-create-complete --stack-name udagram-stack

echo "All stacks created successfully."
