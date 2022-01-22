resource "aws_route53_zone" "primary" {
  name = var.DOMAIN_NAME
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.ALB_DNS_RECORD_NAME
  type    = "A"

  alias {
    name                   = aws_lb.web-server-alb.dns_name
    zone_id                = aws_lb.web-server-alb.zone_id
    evaluate_target_health = true
  }
}
