ec2_region                            = "us-east-1"
ec2_access_key                        = ""
ec2_secret_key                        = ""
ec2_ami_id                            = "ami-053b0d53c279acc90"
ec2_number_of_instances               = 1
ec2_instance_type                     = "t2.micro"
ec2_ami_key_pair_name                 = "ec2-keypair-1"
ec2_vpc_cidr                          = "10.0.0.0/16"
ec2_enable_dns_hostnames              = false
ec2_enable_dns_support                = true
ec2_private_subnets_cidr              = "10.0.1.0/24"
ec2_availability_zones                = "us-east-1a"
ec2_public_subnets_cidr               = "10.0.2.0/24"
ec2_destination_cidr_block            = "0.0.0.0/0"
ec2_allowed_ingress_ports_description = "allowed 22,8000,80,3333"
ec2_cidr_blocks_for_ingress           = "0.0.0.0/0"
ec2_cidr_blocks_for_egress            = "0.0.0.0/0"
ec2_instance_tenancy                  = "default"
ec2_user_data_path                    = "/Users/maximefanin/new_project/terraform/modules/ec2_instance/docker-compose-setup.sh"
ec2_ports_in                          = ["22", "443", "80", "8000", "3333"]
ec2_ports_out                         = ["0"]
