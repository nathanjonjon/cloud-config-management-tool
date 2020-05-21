provider "aws" {
  # access_key = var.access_key
  # secret_key = var.secret_key
  region = var.AWS_REGION
  version = "~> 2.55"
}
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "main-nextlink-gogogo"
  }
}
# ======== Subnet ==================
resource "aws_subnet" "main-public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24" # 剩餘0~255的ip subnet可用
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone

  tags = {
    Name = "main-public"
  }
}
resource "aws_subnet" "main-private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24" # 剩餘0~255的ip subnet可用
  map_public_ip_on_launch = "false"
  availability_zone       = var.availability_zone

  tags = {
    Name = "main-private"
  }
}
# ===========  # Internet Gateway =================
resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
} 

# ===========  Route Table =================
resource "aws_route_table" "main-public-rtb" {
  vpc_id = aws_vpc.main.id
  route{
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main-igw.id
  }
  tags = {
    Name = "main-public-rtb"
  }
}

resource "aws_route_table" "main-private-rtb" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-private-rtb"
  }
}

# route associations public
resource "aws_route_table_association" "main-public-asso-rtb" {
  subnet_id      = aws_subnet.main-public.id
  route_table_id = aws_route_table.main-public-rtb.id
}

resource "aws_route_table_association" "main-private-asso-rtb" {
  subnet_id      = aws_subnet.main-private.id
  route_table_id = aws_route_table.main-private-rtb.id
}

