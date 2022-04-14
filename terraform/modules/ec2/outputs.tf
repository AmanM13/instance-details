################################################################################
# EC2 Outputs
################################################################################

# Local file
output "generated_key_name" {
  value       = resource.local_file.main-local-file.filename
  description = "The name of generated key."
}

# Key pair
output "key_pair_name" {
  value       = resource.aws_key_pair.main-key-pair.key_name
  description = "The name of AWS key-pair."
}

# Launch template
output "launch_template_name" {
  value       = resource.aws_launch_template.main-lt.name
  description = "The name of launch template."
}

output "launch_template_default_version" {
  value       = resource.aws_launch_template.main-lt.default_version
  description = "The default version of launch template."
}

output "launch_template_latest_version" {
  value       = resource.aws_launch_template.main-lt.latest_version
  description = "The latest version of launch template."
}

output "launch_template_ami_name" {
  value       = resource.aws_launch_template.main-lt.image_id
  description = "The image ID of launch template."
}

output "launch_template_instance_type" {
  value       = resource.aws_launch_template.main-lt.instance_type
  description = "The instance type used in launch template."
}

# Target group
output "target_group_name" {
  value       = resource.aws_lb_target_group.main-lb-tg.name
  description = "The name of target group of load balancer."
}

output "target_type" {
  value       = resource.aws_lb_target_group.main-lb-tg.target_type
  description = "The type of target for target group of load balancer."
}

# Autoscaling group
output "autoscaling_group_name" {
  value       = resource.aws_autoscaling_group.main-asg.name
  description = "The name of autoscaling group."
}

output "number_of_ec2s" {
  value       = resource.aws_autoscaling_group.main-asg.desired_capacity
  description = "The desired capacity of EC2 instances to launch."
}

output "max_number_of_ec2s" {
  value       = resource.aws_autoscaling_group.main-asg.max_size
  description = "The maximum number of EC2 instances to launch."
}

output "min_number_of_ec2s" {
  value       = resource.aws_autoscaling_group.main-asg.min_size
  description = "The minimum number of EC2 instances to launch."
}

# Application load balancer
output "load_balancer_name" {
  value       = resource.aws_lb.main-alb.name
  description = "The name of load balancer."
}

output "load_balancer_dns_name" {
  value       = resource.aws_lb.main-alb.dns_name
  description = "The DNS name of load balancer."
}

output "load_balancer_tags" {
  value       = resource.aws_lb.main-alb.tags_all
  description = "The tags of load balancer."
}
