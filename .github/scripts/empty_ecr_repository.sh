#!/bin/bash
REPOSITORY_NAME=$1
IMAGE_IDS=$(aws ecr list-images --repository-name $REPOSITORY_NAME --query 'imageIds[*]' --output json)
if [ -n "$IMAGE_IDS" ]; then
    aws ecr batch-delete-image --repository-name $REPOSITORY_NAME --image-ids "$IMAGE_IDS"
    echo "All images in the repository $REPOSITORY_NAME have been deleted."
else
    echo "No images found in the repository $REPOSITORY_NAME."
fi
