# ################################################################################
# Route 53 Module
# ################################################################################

module "route_53" {
  source = "../modules/route_53/"
  name   = var.dns_name
}
