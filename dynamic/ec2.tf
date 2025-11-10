resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.roboshop_sg.id]
    tags = {
        Name = "terraform-1"
        Terraform = "true"
    }
}

terraform {
  backend "s3" {
    bucket = "daws86s-roboshop"
    key = "terraform-dynamic-block"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
    
  }
}

resource "aws_security_group" "roboshop_sg" {
  name   = "ec2_sg"

  egress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  dynamic "ingress" {
    for_each = toset(var.sg_ports)  # us toset when presented with [list]
    content {
      from_port        = ingress.value # from port 0 to to port 0 means all ports
      to_port          = ingress.value
      protocol         = "tcp" # -1 means all protocols
      cidr_blocks      = ["0.0.0.0/0"] # internet
    }
  }

  tags = {
    Name = "roboshop-strict-sg"
  }
  
}



