variable "AWS_REGION" {
  default = "us-east-1"
}
variable "availability_zone" {
  default = "us-east-1a"
}
variable "key_name" {default = "nathan_east1_key"}


# variable "access_key" {}
# variable "secret_key" {}

variable "bucket_name" {
  default = "nextlink-bucket"
}

variable "webserver_ip" {}
variable "dbserver_ip" {}
variable "web_ami_id" {}
variable "db_ami_id" {}
