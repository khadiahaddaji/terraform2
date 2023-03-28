 provider "aws" {
 }

 resource "aws_vpc" "dev-vpc" {
       cidr_block = "10.0.0.0/16"
       tags = {
        Name:"terraform-vpc2"
        vpc_env:"dev"
       }
 }
resource "aws_subnet" "dev-subnet-1" {
     vpc_id = aws_vpc.dev-vpc.id
     cidr_block=var.cider-bLock
     availability_zone=var.avail_zone
     tags = {
        Name:"sub1-terraform-vpc2"
       }
}
variable avail_zone{
  
}

data "aws_vpc" "existing_vpc"{
    default = true
} 
variable "cider-bLock" {
      description = "subnet cider block"
 }
resource "aws_subnet" "dev-subnet-2" {
     vpc_id = data.aws_vpc.existing_vpc.id
     cidr_block= "172.31.64.0/20"
     availability_zone="eu-west-2a"
     tags = {
        Name:"sub2-terraform-vpc2"
       }
}
output "vpc-id" {
   value = aws_vpc.dev-vpc.id
}
output "sup-id" {
   value = aws_subnet.dev-subnet-1.id
}
output "sup-id2" {
   value = aws_subnet.dev-subnet-2.id
}