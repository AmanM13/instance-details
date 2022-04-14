# ################################################################################
# Route 53 Module
# ################################################################################

resource "aws_route53_zone" "main-zone" {
  name = var.dns_name
}

resource "aws_route53_record" "main-record" {
  zone_id = aws_route53_zone.main-zone.zone_id
  name    = var.dns_name
  type    = "A"
  alias {
    name                   = data.terraform_remote_state.alb.outputs.load_balancer_dns_name
    zone_id                = "Z35SXDOTRQ7X7K"
    evaluate_target_health = true
  }
}
