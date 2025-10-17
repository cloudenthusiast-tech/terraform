variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

# variable "common_name" {
#     default = "${var.project}-${var.environment}"
  
# }

variable "common_tags" {
    type= map
    default= {
        project= "roboshop"
        terraform= "true"
        environment= "dev"
    }
}


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