# Terraform AWS Docker Compose Setup

This Terraform project automates the deployment of a Docker Compose setup on AWS. The Docker Compose configuration deploys a WordPress application with a MySQL database and includes PHPMyAdmin for database management.

## Docker Compose Configuration (`docker-compose.yaml`)

The `docker-compose.yaml` file defines three services:

- ### MySQL Service

- ### WordPress Service

- ### PHPMyAdmin Service

## Terraform AWS Setup

### Docker Compose Setup Script (`docker-compose-setup.sh`)

This script installs Docker and Docker Compose on an Ubuntu machine.

### Terraform Configuration (`main.tf`)

The Terraform configuration sets up an AWS infrastructure with the following components:

- VPC with public and private subnets
- Internet Gateway for public subnet
- Elastic IP (EIP) and NAT Gateway for private subnet
- Security Group allowing specified ingress and egress ports
- EC2 instance(s) using user data to execute the Docker Compose setup script

### Variables Configuration (`variables.tf`)

This file defines variables used in the Terraform configuration. Adjust the values in `terraform.tfvars` to match your requirements.

## Usage

1. Clone this repository to your local machine.

   ```bash
   git clone https://github.com/mikeross23/terraform_docker-compose.git
   cd terraform_docker-compose
   ```

2. Configure your AWS credentials:

   ```bash
   export AWS_ACCESS_KEY_ID="your-access-key-id"
   export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
   ```

3. Update the variables in `terraform.tfvars` with your desired values.

4. Initialize the Terraform configuration:

   ```bash
   terraform init
   ```

5. Apply the Terraform configuration:

   ```bash
   terraform apply
   ```

6. Access WordPress at `http://<AWS_PUBLIC_IP>:8000` and PHPMyAdmin at `http://<AWS_PUBLIC_IP>:3333`.
