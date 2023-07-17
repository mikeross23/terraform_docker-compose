module "ec2_instance" {
  source = "./modules/elastic_network_interface"

  region                 = var.ec2_region
  access_key             = var.ec2_access_key
  secret_key             = var.ec2_secret_key
  ami_id                 = var.ec2_ami_id
  number_of_instances    = var.ec2_number_of_instances
  instance_type          = var.ec2_instance_type
  ami_key_pair_name      = var.ec2_ami_key_pair_name
  vpc_cidr               = var.ec2_vpc_cidr
  enable_dns_hostnames   = var.ec2_enable_dns_hostnames
  enable_dns_support     = var.ec2_enable_dns_support
  private_subnets_cidr   = var.ec2_private_subnets_cidr
  availability_zones     = var.ec2_availability_zones
  public_subnets_cidr    = var.ec2_public_subnets_cidr
  destination_cidr_block = var.ec2_destination_cidr_block
  #allowed_ingress_ports_description = var.ec2_allowed_ingress_ports_description
  cidr_blocks_for_ingress = var.ec2_cidr_blocks_for_ingress
  cidr_blocks_for_egress  = var.ec2_cidr_blocks_for_egress
  instance_tenancy        = var.ec2_instance_tenancy
  #user_data_path                    = var.ec2_user_data_path
  ports_in  = var.ec2_ports_in
  ports_out = var.ec2_ports_out
}

