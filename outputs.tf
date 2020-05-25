output "vpc_id" {
  value = aws_vpc.main.id
}

output "instance_web_id" {
  value = aws_instance.Nathan_WebServer.id
}

# output "instance_DB_id" {
#   value = aws_instance.Nathan_DB.id
# }

