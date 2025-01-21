output "vpc_id" {
  value = aws_vpc.max_vpc.id
}
output "subnet_ids" {
  value = aws_subnet.subnets[*].id
}
