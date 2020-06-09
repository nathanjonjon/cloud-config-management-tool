terraform {
    backend "s3" {
        bucket = "awx-nextlinker-cmdb"
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}