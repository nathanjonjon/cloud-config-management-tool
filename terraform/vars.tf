variable "AWS_REGION" {
  default = "us-east-1"
}
variable "availability_zone" {
  default = "us-east-1a"
}
variable "key_name" {default = "nathan_east1_key"}


# variable "access_key" {}
# variable "secret_key" {}

variable "webserver_ip" {
  default = "10.0.1.10"
}
variable "bucket_name" {
  default = "nextlink-bucket"
}

variable "web_ami_id" {default = ""}

variable "db_ami_id" {default = ""}