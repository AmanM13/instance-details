################################################################################
# EC2 Outputs
################################################################################

# Local file
output "generated_key_name" {
  value       = module.ec2.generated_key_name
  description = "The name of generated key."
}

# Key pair
output "key_pair_name" {
  value       = module.ec2.key_pair_name
  description = "The name of AWS key-pair."
}

# Launch template
output "launch_template_name" {
  value       = module.ec2.launch_template_name
  description = "The name of launch template."
}

output "launch_template_default_version" {
  value       = module.ec2.launch_template_default_version
  description = "The default version of launch template."
}

output "launch_template_latest_version" {
  value       = module.ec2.launch_template_latest_version
  description = "The latest version of launch template."
}

output "launch_template_ami_name" {
  value       = module.ec2.launch_template_ami_name
  description = "The image ID of launch template."
}

output "launch_template_instance_type" {
  value       = module.ec2.launch_template_instance_type
  description = "The instance type used in launch template."
}

# Target group
output "target_group_name" {
  value       = module.ec2.target_group_name
  description = "The name of target group of load balancer."
}

output "target_type" {
  value       = module.ec2.target_type
  description = "The type of target for target group of load balancer."
}

# Autoscaling group
output "autoscaling_group_name" {
  value       = module.ec2.autoscaling_group_name
  description = "The name of autoscaling group."
}

output "number_of_ec2s" {
  value       = module.ec2.number_of_ec2s
  description = "The desired capacity of EC2 instances to launch."
}

output "max_number_of_ec2s" {
  value       = module.ec2.max_number_of_ec2s
  description = "The maximum number of EC2 instances to launch."
}

output "min_number_of_ec2s" {
  value       = module.ec2.min_number_of_ec2s
  description = "The minimum number of EC2 instances to launch."
}

# Application load balancer
output "load_balancer_name" {
  value       = module.ec2.load_balancer_name
  description = "The name of load balancer."
}

output "load_balancer_dns_name" {
  value       = module.ec2.load_balancer_dns_name
  description = "The DNS name of load balancer."
}

output "load_balancer_tags" {
  value       = module.ec2.load_balancer_tags
  description = "The tags of load balancer."
}
