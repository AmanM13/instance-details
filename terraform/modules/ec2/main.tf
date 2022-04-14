################################################################################
# EC2 Module
################################################################################

# TLS private key
resource "tls_private_key" "main-tls-pvt-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Local file
resource "local_file" "main-local-file" {
  content         = tls_private_key.main-tls-pvt-key.private_key_pem
  filename        = var.generated_key_name
  file_permission = 0400
}

# Key pair
resource "aws_key_pair" "main-key-pair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.main-tls-pvt-key.public_key_openssh
}

# Launch template
resource "aws_launch_template" "main-lt" {
  name = var.launch_template_name
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = var.volume_size
    }
  }
  image_id               = var.ami_name
  instance_type          = var.ec2_instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = [data.terraform_remote_state.instance-sg.outputs.instance_sg_id]
  tag_specifications {
    resource_type = "instance"
    tags          = var.lt_tags
  }
  user_data = filebase64("${path.module}/user_data.sh")
}

# Target group
resource "aws_lb_target_group" "main-lb-tg" {
  name             = var.lb_tg_name
  target_type      = "instance"
  port             = 8000
  protocol_version = "HTTP1"
  protocol         = "HTTP"
  health_check {
    enabled             = true
    healthy_threshold   = 5
    interval            = 30
    matcher             = 200
    path                = "/ec2"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
  vpc_id               = data.terraform_remote_state.vpc.outputs.vpc_id
  deregistration_delay = 300
  stickiness {
    enabled = false
    type    = "app_cookie"
  }
  slow_start                    = 0
  load_balancing_algorithm_type = "round_robin"
}

# Autoscaling group
resource "aws_autoscaling_group" "main-asg" {
  name                = var.asg_name
  vpc_zone_identifier = [data.terraform_remote_state.public-subnet.outputs.subnet_id, data.terraform_remote_state.public-subnet2.outputs.subnet2_id]
  desired_capacity    = var.number_of_ec2s
  force_delete        = true
  max_size            = var.max_number_of_ec2s
  min_size            = var.min_number_of_ec2s
  launch_template {
    id      = aws_launch_template.main-lt.id
    version = var.launch_template_version
  }
  target_group_arns = [aws_lb_target_group.main-lb-tg.arn]
}

# Autoscaling attachment
resource "aws_autoscaling_attachment" "main-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.main-asg.id
  lb_target_group_arn    = aws_lb_target_group.main-lb-tg.arn
}

# Application load balancer
resource "aws_lb" "main-alb" {
  name                       = var.lb_name
  internal                   = false
  load_balancer_type         = "application"
  idle_timeout               = 60
  security_groups            = [data.terraform_remote_state.lb-sg.outputs.lb_sg_id]
  subnets                    = [data.terraform_remote_state.public-subnet.outputs.subnet_id, data.terraform_remote_state.public-subnet2.outputs.subnet2_id]
  enable_deletion_protection = false
  tags                       = var.lb_tags
  ip_address_type            = "ipv4"
  enable_http2               = true
  desync_mitigation_mode     = "defensive"
  drop_invalid_header_fields = false
  enable_waf_fail_open       = false
}

# Application load balancer listener
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.main-alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.main-lb-tg.arn
    type             = "forward"
  }
}


