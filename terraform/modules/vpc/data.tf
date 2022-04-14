################################################################################
# VPC Data Source
################################################################################

# Data source to fetch the IP of the machine.
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
