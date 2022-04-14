################################################################################
# EC2 Module
################################################################################

module "ec2" {
  source = "../modules/ec2/"

  # Local file
  generated_key_name = var.generated_key_name

  # Key pair
  key_pair_name = var.key_pair_name

  # Launch template
  launch_template_name = var.launch_template_name
  volume_size          = var.volume_size
  ami_name             = var.ami_name
  ec2_instance_type    = var.ec2_instance_type
  lt_tags              = var.lt_tags

  # Target group
  lb_tg_name = var.lb_tg_name

  # Autoscaling group
  asg_name                = var.asg_name
  number_of_ec2s          = var.number_of_ec2s
  max_number_of_ec2s      = var.max_number_of_ec2s
  min_number_of_ec2s      = var.min_number_of_ec2s
  launch_template_version = var.launch_template_version

  # Application load balancer
  lb_name = var.lb_name
  lb_tags = var.lb_tags

}
