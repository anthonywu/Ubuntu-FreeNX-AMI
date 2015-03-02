#!/bin/bash -e

group_name="ubuntu-nx-workstation"

if ! aws ec2 describe-security-groups --group-names "$group_name" 2> /dev/null; then
  aws ec2 create-security-group \
    --group-name "$group_name" \
    --description "Ubuntu NX Builder: SSH:22 + NX:4000"
fi

aws ec2 describe-security-groups --group-names "$group_name" --output json > ./private/sec-group.json

jq --raw-output .SecurityGroups[0].IpPermissions[].ToPort ./private/sec-group.json > ./private/port_existence

# Allow SSH 22
if ! grep 22 ./private/port_existence > /dev/null; then
  aws ec2 authorize-security-group-ingress \
    --group-name "$group_name" \
    --cidr "0.0.0.0/0" \
    --port 22 \
    --protocol tcp
fi

# TODO: it's possible that FreeNX does not using 4000/4684

# Allow NX 4000
if ! grep 4000 ./private/port_existence > /dev/null; then
  aws ec2 authorize-security-group-ingress \
    --group-name "$group_name" \
    --cidr "0.0.0.0/0" \
    --port 4000 \
    --protocol tcp
fi

# Allow NX 4684 UDP
if ! grep 4684 ./private/port_existence > /dev/null; then
  aws ec2 authorize-security-group-ingress \
    --group-name "$group_name" \
    --cidr "0.0.0.0/0" \
    --port 4684 \
    --protocol udp
fi

aws ec2 describe-security-groups --group-names "$group_name" --output json > ./private/sec-group.json
jq .SecurityGroups[0] ./private/sec-group.json
