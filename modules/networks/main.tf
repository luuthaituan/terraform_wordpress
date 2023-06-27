resource "aws_vpc" "wordpress-vpc-dev" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "wordpress-vpc-dev"
  }
}

resource "aws_subnet" "wordpress-public_subnetA-dev" {
  vpc_id                  = aws_vpc.wordpress-vpc-dev.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "wordpress-public_subnetA-dev"
  }
}

resource "aws_subnet" "wordpress-public_subnetB-dev" {
  vpc_id                  = aws_vpc.wordpress-vpc-dev.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "wordpress-public_subnetB-dev"
  }
}

resource "aws_subnet" "wordpress-private_subnetA-dev" {
  vpc_id     = aws_vpc.wordpress-vpc-dev.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"
  tags = {
    Name = "wordpress-private_subnetA-dev"
  }
}

resource "aws_subnet" "wordpress-private_subnetB-dev" {
  vpc_id     = aws_vpc.wordpress-vpc-dev.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-southeast-1b"
  tags = {
    Name = "wordpress-private_subnetB-dev"
  }
}

# resource "aws_security_group" "wordpress-sg-dev" {
#   name_prefix = "wordpress-sg-dev"
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
