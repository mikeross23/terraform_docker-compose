variable "region" {
  type = string
}
variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "number_of_instances" {
  type = number
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
variable "allowed_ingress_ports_description" {
  type = string
}
variable "cidr_blocks_for_ingress" {
  type    = string
  default = "0.0.0.0/0"
}
variable "cidr_blocks_for_egress" {
  type    = string
  default = "0.0.0.0/0"
}
variable "instance_tenancy" {
  type = string
}
variable "user_data_path" {
  type = string
}
variable "ports_in" {
  type = list(number)
}
variable "ports_out" {
  type = list(number)
}
