# EC2 Module

This module makes it easier to create:
- TLS private key
- Local key file
- Key pair
- Launch template
- Target group
- Autoscaling group
- Autoscaling attachment
- Application load balancer
- Application load balancer listener

## Usage

Basic usage of this module is as follows:

* EC2

  ```hcl
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
  ```

* Provide the variables values to the modules from terraform.tfvars file.

  ```hcl
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
    Environment = "example-environment"
  }
  ```

* Perform the following commands in the directory:

   Get the plugins
   ```
   terraform init
   ``` 
   Create the infrastructure plan
   ```
   terraform plan
   ``` 
   Execute the infrastructure plan
   ```
   terraform apply
   ``` 
   Destroy the built infrastructure
   ```
   terraform destroy
   ``` 
## Launch and access application
1. Go to AWS console, head over to running instances and SSH into the VM from the same path.
2. Run command
    ```
    sudo docker run -e AWS_ACCESS_KEY_ID=<enter_access_key_ID_here> -e AWS_SECRET_ACCESS_KEY=<enter_secret_access_key_here> -d -p 8000:8000 rootxaman/instance_details:latest
    ```
3. Access application
   - Terminal
      ```
      curl localhost:8000/ec2
      ```
   - Browser
      ```
      http://<load_balancer_dns>/ec2
      ```

