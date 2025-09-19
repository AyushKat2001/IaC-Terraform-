## Infrastructure Deployment Using Terraform (IaC)

This project uses Terraform to create a custom AWS Virtual Private Cloud (VPC) with a public subnet and deploys an EC2 instance within that subnet.Also creates S3 bucket. It is intended for learning Infrastructure as Code (IaC) concepts using Terraform and AWS.

### Project Structure

The project contains several Terraform files:

- main.tf: Contains the main configuration, including the VPC, subnet, security group, internet gateway, and EC2 instance.

- variables.tf: Defines the input variables used in the project.

- outputs.tf: Defines the outputs, such as the public IP of the EC2 instance.

- terraform.tfvars: Contains the values for the input variables. This file is optional and may contain sensitive information.

### Prerequisites

- Before running the project, you need:

- Terraform installed on your system.

- An AWS account.

- AWS credentials configured either through the AWS CLI or environment variables.

### Deployment Steps

- Initialize Terraform to download the required provider plugins. (terraform.init)

- Preview the planned infrastructure to see what resources will be created. (terraform plan)

- Apply Terraform to create all resources in AWS. (terraform apply -auto-approve)

- Check outputs such as the public IP of the EC2 instance.

- When finished, destroy the resources to avoid unnecessary costs. (terraform destroy -auto-approve)

### Outputs 

- A custom VPC

- A Public Subnet

- An Internet gateway attached to the VPC

- Security Groups allowing SSH access

- An EC2 instance in the public subnet accessible via a public IP address

- A S3 Bucket with versioning enabled

### References

- Terraform AWS Provider documentation.

- AWS VPC documentation.

- Terraform best practices guides.
  
