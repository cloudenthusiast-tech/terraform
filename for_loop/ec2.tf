provider "aws" {
}

resource "aws_instance" "roboshop_ec2" {
    for_each = var.instances
   # for_each= toset(var.instances) #list to set
    #count= length(var.instances)
    ami = var.ami_id
    instance_type = each.value
    #instance_type = "t3.micro"  <-# in-case of this loop-> for_each= toset(var.instances)  
     vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = each.key
        #Name= each.value
        Terraform = "true"
    }
}

resource "aws_security_group" "allow_all" {
  name   = var.ec2-sg

  egress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  ingress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  tags = {
    Name = "allow-all"
  }

}