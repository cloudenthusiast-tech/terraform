
data "aws_ami" "devops_ami_id" {
   owners           = ["973714476881"]
   most_recent      = true

    filter {
        name = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

    filter {
        name= "root-device-type"
        values = ["ebs"]
    }

    filter {
        name="virtualization-type"
        values = ["hvm"]
    }
    }

    output "aws_ami" {
        value = data.aws_ami.devops_ami_id.id
    }

data "aws_instance" "ansible_server" {
    instance_id = "i-0f771002aef173707"
  
}

output "ansible_server_info"{
    value = data.aws_instance.ansible_server.private_ip
}
