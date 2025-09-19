output "ec2_public_ip" {
    description = "Public IP of the EC2"
    value = aws_instance.my-ec2.public_ip
}
output "bucket" {
    description = "Name of the Bucket created"
    value = aws_s3_bucket.s3_bucket.bucket
}
output "ec2_subnet_ip" {
    description = "Subnet_IP which we created and launch EC2 instance On"
    value = aws_instance.web.public_ip
  
}