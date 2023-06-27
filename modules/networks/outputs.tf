output "wordpress-public_subnetA-dev" {
  value = aws_subnet.wordpress-public_subnetA-dev.id
}

output "wordpress-private_subnetA-dev" {
  value = aws_subnet.wordpress-private_subnetA-dev.id
}

output "wordpress-public_subnetB-dev" {
  value = aws_subnet.wordpress-public_subnetB-dev.id
}

output "wordpress-private_subnetB-dev" {
  value = aws_subnet.wordpress-private_subnetB-dev.id
}

output "vpc_id" {
  value = aws_vpc.wordpress-vpc-dev.id
}
