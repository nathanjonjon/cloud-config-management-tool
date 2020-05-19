variable "AWS_REGION" {
  default = "us-east-1"
}

variable "aws_key_pair" { # read key pair
  default = "./aws_key_pair/tom-terraform.pem"
}

variable "availability_zone" {
  default = "us-east-1a"
}

