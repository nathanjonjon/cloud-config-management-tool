resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "80 port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16", "220.133.223.215/32", "211.75.165.158/32"]
  }

  ingress {
    description = "22 port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16", "220.133.223.215/32", "211.75.165.158/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {Name = "Nathan_WebServer_sg", Owner = "Nathan"}
  
}

resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "80 port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }
  ingress {
    description = "22 port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {Name = "Nathan_DB_sg", Owner = "Nathan"}
  
}

resource "aws_instance" "Nathan_WebServer" {
  # ami             = "ami-003634241a8fcdec0"
  ami = data.aws_ami.ubuntu.id # Ubuntu Server  latest version
  instance_type   = "t2.micro"
  availability_zone = var.availability_zone
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id = aws_subnet.main-public.id
  tags = {Name = "Nathan_WebServer", Owner = "Nathan"}
}

resource "aws_instance" "Nathan_DB" {
  ami = data.aws_ami.ubuntu.id # Ubuntu Server  latest version
  instance_type   = "t2.micro"
  availability_zone = var.availability_zone
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  subnet_id = aws_subnet.main-private.id
  tags = {Name = "Nathan_DB", Owner = "Nathan"}
}
