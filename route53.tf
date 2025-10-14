resource "aws_route53_record" "roboshop" {
  count = 4
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"  #mongodb.kolanu.space
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop-ec2[count.index].private_ip]
}