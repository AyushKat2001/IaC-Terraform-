provider "aws" {
    region = var.aws_region
}
# EC2 Instance
resource "aws_instance" "my-ec2" {
    ami = var.ami_id
    instance_type = var.instance_type

    tags = {
        Name = "Terraform-EC2"
    }
}

# S3 Bucket
resource "aws_s3_bucket" "s3_bucket" {
    bucket = var.bucket_name

    tags = {
        Name = "Terraform-bucket"
    }
}

# Bucket Versioning
resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.s3_bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}

# VPC
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "Terraform-VPC"
    }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id   
}

# Public Subnet
resource "aws_subnet" "Public" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1a"

    tags = {
      Name = "Public-Subnet"
    }
}

# Route Table
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id
  
}
resource "aws_route" "internet_access" {
    route_table_id = aws_route_table.public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
}
resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.Public.id
    route_table_id = aws_route_table.public_rt.id
}

# Security Group
resource "aws_security_group" "allow_ssh" {
    vpc_id = aws_vpc.main.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
# Launching Instance in Public Subnet
resource "aws_instance" "web" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.Public.id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
      Name = "Terraform-Web-Server"
    }
  
}