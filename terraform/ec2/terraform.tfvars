################################################################################
# EC2 Variable Values
################################################################################

# Note: A few variable values are commented to take input from user.

# Local file
generated_key_name = "example-kp.pem"

# Key pair
key_pair_name = "example-kp"

# Launch template
launch_template_name = "example-lt"
# volume_size          = 20
# ami_name             = "ami-01896de1f162f0ab7"
# ec2_instance_type    = "t2.micro"
lt_tags = {
  purpose = "instance"
}

# Target group
lb_tg_name = "example-lb-tg"

# Autoscaling group
asg_name                = "example-asg"
# number_of_ec2s          = 2
max_number_of_ec2s      = 3
min_number_of_ec2s      = 1
launch_template_version = 1

# Application load balancer
lb_name = "example-lb"
lb_tags = {
  Environment = "production"
}
