variable "AWS_REGION" {
  default = "us-east-1"
}

variable "aws_key_pair" { # read key pair
  default = "../KeyPairs/Virginia/nathan_east1_key.pem"
}

variable "availability_zone" {
  default = "us-east-1a"
}
variable "key_name" {
  default = "nathan_east1_key"
}

variable "credentials_path" {
	default = "../terraform.tfvars"
}

variable "access_key" {}
variable "secret_key" {}
