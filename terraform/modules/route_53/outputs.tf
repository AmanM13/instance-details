# ################################################################################
# Route 53 Output
# ################################################################################

output "dns_name" {
  value       = resource.aws_route53_record.main-record.name
  description = "The DNS name."
}
