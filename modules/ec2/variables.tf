variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "wordpress-public_subnetA-dev" {
  type = string
}

variable "wordpress-public_subnetB-dev" {
  type = string
}

variable "wordpress-private_subnetA-dev" {
  type = string
}

variable "wordpress-private_subnetB-dev" {
  type = string
}

variable "vpc_id" {
  type = string
}
