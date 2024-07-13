#!/bin/bash
while true; do
STATUS=$(aws eks describe-nodegroup --nodegroup-name $1 --cluster-name $2 --region $3 --query "nodegroup.status" --output text || echo "DELETED")
if [ "$STATUS" = "DELETED" ]; then
    echo "Node group deleted."
    break
else
    echo "Waiting for node group deletion..."
    sleep 30
fi
done
