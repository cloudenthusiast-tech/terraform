provider "aws" {

}
resource "aws_instance" "roboshop-ec2" {
    ami= var.ami_id
    count= 4
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"
    vpc_security_group_ids = [aws_security_group.roboshop-sg-in.id, aws_security_group.roboshop-sg-out.id]
    tags = {
      Name= var.instances[count.index]
      terraform= true
    }
  
}

resource "aws_security_group" "roboshop-sg-in" {
  name= var.ec2-sg
    ingress{
        from_port= var.from_port
        to_port= var.to_port
        protocol= var.protocol
        cidr_blocks= var.cidr
    }
}

resource "aws_security_group" "roboshop-sg-out" {
      egress  {
        from_port= var.from_port
        to_port= var.to_port
        protocol= var.protocol
        cidr_blocks= var.cidr
    } 
}

