provider "aws" {
}

terraform {
  backend "s3" {
    bucket = "daws86s-roboshop"
    key = "terraform-remote-demo"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
    
  }
}

resource "aws_instance" "roboshop_ec2" {
    ami= var.ami_id
    count= length(var.instances)
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"
    vpc_security_group_ids = [aws_security_group.roboshop-sg.id]
    tags = {
      Name= var.instances[count.index]
      terraform= true
    }
  
}

resource "aws_security_group" "roboshop-sg" {
  name= var.ec2-sg
    ingress{
        from_port= var.from_port
        to_port= var.to_port
        protocol= var.protocol
        cidr_blocks= var.cidr
    }
      egress  {
        from_port= var.from_port
        to_port= var.to_port
        protocol= var.protocol
        cidr_blocks= var.cidr
    } 
}

