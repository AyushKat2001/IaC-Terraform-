variable "aws_region" {
    description = "Aws region to deploy"
    default = "ap-south-1"
}

variable "ami_id" {
    description = "AMI ID for the EC2"
    type = string
}

variable "instance_type" {
    description = "Type of instance to deploy"
    default = "t2.micro"
}

variable "bucket_name" {
    description = "Unique S3 bucket"
    type = string
}