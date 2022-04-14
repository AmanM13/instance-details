# Route 53 Module

This module makes it easier to create:
- Hosted zone
- Record

## Usage

Basic usage of this module is as follows:

* Route 53

  ```hcl
  module "route_53" {
    source = "../modules/route_53/"
    name   = var.dns_name
  }
  ```

* Provide the variables values to the modules from terraform.tfvars file.

  ```hcl

  # Note: Variable value is commented to take input from user.

  # dns_name = "amanmanapure.ml"
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
## Access application 
1. On console, head over to route 53 and open your hosted zone and copy those namservers.
2. Go to your domain, choose edit nameservers, select custom, paste them and save.
3. Access application
   - Browser
      ```
      http://<dns_name>/ec2
      ```
