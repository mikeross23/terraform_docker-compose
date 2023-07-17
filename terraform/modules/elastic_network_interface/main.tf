provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
resource "aws_instance" "wordpress" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.ami_key_pair_name
  user_data     = file("/Users/maximefanin/new_project/terraform_docker-compose/terraform/modules/elastic_network_interface/apache.sh")
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.test.id
  }
}
# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  instance_tenancy     = var.instance_tenancy
}
# Internet Gateway for Public Subnet
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id
}
# Provides an Elastic network interface (ENI) resource
resource "aws_network_interface" "test" {
  subnet_id       = aws_subnet.public_subnet.id
  private_ips     = ["10.0.2.201"]
  security_groups = [aws_security_group.allowed_ports.id]
}
# Routing tables to route traffic for Public Subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
}
# Routing tables to route traffic for Public Subnet
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
}
# Route table associations for both Public & Private Subnets
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private.id
}
# Route for Internet Gateway
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = aws_internet_gateway.ig.id
}
# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets_cidr
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = true
}
# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnets_cidr
  availability_zone       = var.availability_zones
  map_public_ip_on_launch = false
}
# Security groops
resource "aws_security_group" "allowed_ports" {
  vpc_id = aws_vpc.vpc.id
  dynamic "ingress" {
    for_each = toset(var.ports_in)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.cidr_blocks_for_ingress]
    }
  }
  dynamic "egress" {
    for_each = toset(var.ports_out)
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "-1"
      cidr_blocks = [var.cidr_blocks_for_egress]
    }
  }

}
resource "aws_eip" "elastic_ip" {
  vpc                       = true
  network_interface         = aws_network_interface.test.id
  associate_with_private_ip = "10.0.2.201"
  depends_on                = [aws_internet_gateway.ig, aws_instance.wordpress]
}
output "server_public_ip" {
  value = aws_eip.elastic_ip
}
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.vpc.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
}
