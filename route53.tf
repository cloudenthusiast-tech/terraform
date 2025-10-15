resource "aws_route53_record" "roboshop" {
  count = 2
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}" == "frontend" ? "${var.domain_name}" : "${var.instances[count.index]}.${var.domain_name}"  #mongodb.kolanu.space
  type    = "A"
  ttl     = 1
  records = "${var.instances[count.index]}" == "frontend" ? [aws_instance.roboshop_ec2[count.index].public_ip] : [aws_instance.roboshop_ec2[count.index].private_ip] 
}