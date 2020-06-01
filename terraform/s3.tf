resource "aws_s3_bucket" "nextlink_s3" {
    bucket = var.bucket_name
    acl = "private"
    versioning{ # 儲存多個版本號，若之後開發上遇到問題，可退回舊的版本
      enabled = true
    }
    tags = {
        Name = "nextlink_bucket"
    }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.AWS_REGION}.s3"
}

resource "aws_vpc_endpoint_route_table_association" "rtb_association" {
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
  route_table_id = aws_route_table.main-private-rtb.id
}




