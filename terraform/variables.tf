variable "ec2_region" {
  type = string
}
variable "ec2_access_key" {
  type = string
}
variable "ec2_secret_key" {
  type = string
}
variable "ec2_ami_id" {
  type = string
}
variable "ec2_number_of_instances" {
  type = number
}
variable "ec2_instance_type" {
  type = string
}
variable "ec2_ami_key_pair_name" {
  type = string
}
variable "ec2_vpc_cidr" {
  type = string
}
variable "ec2_enable_dns_hostnames" {
  type    = bool
  default = false
}
variable "ec2_enable_dns_support" {
  type    = bool
  default = true
}
variable "ec2_private_subnets_cidr" {
  type = string
}
variable "ec2_availability_zones" {
  type = string
}
variable "ec2_public_subnets_cidr" {
  type    = string
  default = "0.0.0.0/0"
}
variable "ec2_destination_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}
variable "ec2_allowed_ingress_ports_description" {
  type = string
}
variable "ec2_cidr_blocks_for_ingress" {
  type = string
}
variable "ec2_cidr_blocks_for_egress" {
  type    = string
  default = "0.0.0.0/0"
}
variable "ec2_instance_tenancy" {
  type = string
}
variable "ec2_user_data_path" {
  type = string
}
variable "ec2_ports_in" {
  type = list(number)
}
variable "ec2_ports_out" {
  type = list(number)
}

