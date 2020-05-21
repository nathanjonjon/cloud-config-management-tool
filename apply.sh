#!/bin/bash

echo start
terraform apply -var-file="../NathanCredentials.tfvars"
# terraform destroy -var-file="../NathanCredentials.tfvars"
