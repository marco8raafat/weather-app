output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.subnet-public.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gw.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}
