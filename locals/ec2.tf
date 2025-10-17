provider "aws" {
}

resource "aws_instance" "roboshop_ec2" {
    
    ami = local.ami_id
    instance_type = local.instance_type
     vpc_security_group_ids = [aws_security_group.allow_all.id]
    # tags = merge(
    #   var.common_tags,
    #   {
    #     Name= "${local.common_name}-local-demo"
    #   }
    # )  
    tags = local.ec2_tags 
    }


resource "aws_security_group" "allow_all" {
  name   = "${local.common_name}-allow_all"

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

  tags = local.ec2_tags 
    

}