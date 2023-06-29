variable "region" {
  type = string
}
variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}
variable "instance_name" {
  type    = string
  default = "ec2_instance"
}
variable "ami_id" {
  type = string
}
variable "number_of_instances" {
  type = number
}
variable "subnet_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "ami_key_pair_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "enable_dns_hostnames" {
  type    = bool
  default = false
}
variable "enable_dns_support" {
  type    = bool
  default = true
}
variable "private_subnets_cidr" {
  type = string
}
variable "availability_zones" {
  type = string
}
variable "public_subnets_cidr" {
  type = string
}
variable "destination_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}
variable "aws_security_group_name" {
  type    = string
  default = "allow_tls"
}
variable "allowed_ingress_ports_description" {
  type = string
}
variable "allowed_ingress_ports" {
  type        = string
  description = "Example: 22,80,8080,8000,3333 etc."
}
variable "cidr_blocks_for_ingress" {
  type    = string
  default = "0.0.0.0/0"
}
variable "cidr_blocks_for_egress" {
  type    = string
  default = "0.0.0.0/0"
}
variable "ipv6_cidr_blocks" {
  type    = string
  default = "::/0"
}
