#!/bin/bash
load_balancers=$(aws elb describe-load-balancers --query "LoadBalancerDescriptions[*].LoadBalancerName" --output text)
if [ -n "$load_balancers"]; then
    >&2 echo "No load balancer name found"
    echo "no-load-balancer-name-found"
fi
for lb in $load_balancers; do
    result=$(aws elb describe-tags --load-balancer-names "$lb" --query "TagDescriptions[?Tags[?Key=='kubernetes.io/service-name' && Value=='default/$1']].LoadBalancerName" --output text)
    if [ -n "$result" ]; then
        echo "$lb"
    fi
done
