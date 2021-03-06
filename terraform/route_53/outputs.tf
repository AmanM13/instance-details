# ################################################################################
# Route 53 Output
# ################################################################################

output "dns_name" {
  value       = module.route_53.dns_name
  description = "The DNS name."
}
