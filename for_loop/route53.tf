resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.roboshop_ec2
  zone_id = var.zone_id
  name    = "${each.key}" == "frontend" ? "${var.domain_name}" : "${each.key}.${var.domain_name}"  #mongodb.kolanu.space
  type    = "A"
  ttl     = 1
  records = "${each.key}" == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
}