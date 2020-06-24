#!/bin/bash

echo start
# terraform apply -var-file="../NathanCredentials.tfvars"
terraform apply -var-file="/aws_key_pair/TomCredentials.tfvars"
