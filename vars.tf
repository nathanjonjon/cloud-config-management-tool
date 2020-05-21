variable "AWS_REGION" {
  default = "us-east-1"
}

variable "aws_key_pair" { # read key pair
  default = "./aws_key_pair/tom-virginia.pem"
}

variable "availability_zone" {
  default = "us-east-1a"
}
variable "key_name" {
  default = "tom-virginia"
}

