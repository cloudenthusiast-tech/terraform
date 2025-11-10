variable "ami_id" {
    description = "instance-ami-id"
    type = string
    default = "ami-09c813fb71547fc4f"
}
variable "sg_ports" {
    default = [80,8080,3306,22017,9000,22,443]
  
}

# variable "instance_type" {
#     type = string
#     default = "t3.micro"  
# }

# variable "from_port" {
#     default = 0
# }

# variable "to_port" {
#     default = 0
# }

# variable "protocol" {
#     default = "-1" 
# }

# variable "cidr" {
#     default = ["0.0.0.0/0"]
# }

# # variable "ec2-tag" {
# #     type= map
# #     default= {
# #         Name= "terraform"
# #         terraform= "true"
# #         environment= "dev"
# #     }
# # }

variable "ec2-sg"{
    type= string
    description= "sh for ec2-instace"
    default= "allow-all"
}

# variable "environment"{
#     type= string
#     default= "dev"
# }

# variable "instances" {
#     #default= ["mongodb", "catalogue", "cart"]
#     type = map
#     default = {
#         frontend= "t3.medium"
#         mongodb= "t3.micro"
#     }
  
# }

variable "zone_id"{
    default = "Z10446792H6QP6XMMVXFH"
}

variable "domain_name" {
    default = "kolanu.space"
}