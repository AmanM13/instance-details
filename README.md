# instance-details
`instance-details` lets you easily create infrastructure on AWS and deploy an application that displays the information of all running EC2 instances.
## Project breakdown
- Creating an application to return a list of all running EC2 instances in a region in an AWS account along with their corresponding IPs and Tags when called on the **/ec2** path
- Building and pushing container image of application to registry
- IaC(Infrastructure as Code) to automate deployment of infrastructure on AWS
## Tech stack:
| | Technology | | Description |
| ----------- | ----------- | ----------- | ----------- |
| ✦ | Python | | programming language |
| | | pip | package-management system |
| | | flask | micro web framework |
| | | gunicorn | web server gateway interface HTTP server |
| | | boto3 | python SDK for AWS |
| ✦ | Docker | | containerization platform |
| ✦ | AWS | | public cloud platform |
| | | instance | virtual server |
| | | launch template | launch parameters for instance |
| | | ASG | Auto Scaling group: logical grouping of instances |
| | | target group | request routing to registered targets |
| | | ALB | Application Load Balancer: configuring and routing incoming end-user traffic to apps |
| | | route 53 | Domain Name System service |
| | | security Group | virtual firewall |
| ✦ | Terraform | | infrastructure as code software tool | 
## Initial steps
- Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- Create AWS [credentials](https://us-east-1.console.aws.amazon.com/iam/home?region=us-east-1&skipRegion=true#/security_credentials)
- Configure above AWS credentials locally by inserting respective values
  ```
  aws configure
  ```
> Application creation and containerization steps can be found [`here`](https://github.com/AmanM13/instance-details/tree/main/application).
## Infrastructure deployment
Resources are segregated as per the services and their components. More details in respective directories.
### Dependencies
- [Terraform](https://www.terraform.io/downloads.html)
### Features
- Modularized structure
- Terraform backend state maintained in S3 bucket with versioning enabled
- Isolation between the terraform tfstate files for the AWS resources for reducing impact
- Terraform tfvars used for passing variable values
- Consistent structure and naming convention
### Backend configuration
- Best for teams to store the Terraform state file remotely
- Teams have access to latest copy of infrastructure always
- Supports state locking and consistency checking
- Three things required: 
  - Terraform S3 backend resource
  - S3 bucket to store the state file
  - DynamoDB table for state locking and and consistency checking
  ```hcl
  terraform {
    backend "s3" {
      bucket         = "example-s3"
      key            = "path/to/my/key" // e.g "prod/route_53.tfstate"
      region         = "us-east-1"
      encrypt        = "true"
      dynamodb_table = "example-table"
    }
  }
  ```
### Terraform resources structure
    ├── README.md                 // Description of the module and it's purpose
    ├── backend.tf                // To create terraform backend state configuration
    ├── data.tf                   // It contains the declarations for data sources
    ├── main.tf                   // The primary entrypoint for terraform resources
    ├── outputs.tf                // It contains the declarations for outputs
    ├── terraform.tfvars          // The file to pass the terraform variables values
    ├── variables.tf              // It contains the declarations for variables
    ├── versions.tf               // To specify terraform versions and providers
### Resource provisioning order
1. [DynamoDB Table](https://github.com/AmanM13/instance-details/tree/main/terraform/dynamodb_table)
2. [S3](https://github.com/AmanM13/instance-details/tree/main/terraform/s3)
3. [VPC](https://github.com/AmanM13/instance-details/tree/main/terraform/vpc)
4. [EC2](https://github.com/AmanM13/instance-details/tree/main/terraform/ec2)
5. [Route 53](https://github.com/AmanM13/instance-details/tree/main/terraform/route_53)
### Provisioning steps
1. Headover to the path of the resource to be deployed 
2. Run 
    ```
    terraform init
    ```
    ```
    terraform plan
    ```
    ```
    terraform apply
    ```
 
    | Command     | Description |
    | ----------- | ----------- |
    | terraform init | initializes a working directory containing Terraform configuration files |
    | terraform plan | creates an execution plan, which lets us preview the changes that Terraform plans to make to our infrastructure |
    | terraform apply | executes the actions proposed in the Terraform plan |

    **Note:**
    Above commands should be run from the resource directories. The modules directory consists of root modules and will not change anything unless it is necessary.
### Terraform directory structure
```
├── dynamodb_table
│   ├── main.tf
│   ├── outputs.tf
│   ├── README.md
│   ├── terraform.tfvars
│   ├── variables.tf
│   └── versions.tf
├── ec2
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── README.md
│   ├── terraform.tfvars
│   ├── variables.tf
│   └── versions.tf
├── modules
│   ├── dynamodb_table
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   ├── ec2
│   │   ├── data.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── user_data.sh
│   │   ├── variables.tf
│   │   └── versions.tf
│   ├── route_53
│   │   ├── data.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   ├── s3
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── variables.tf
│   │   └── versions.tf
│   └── vpc
│       ├── data.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── variables.tf
│       └── versions.tf
├── README.md
├── route_53
│   ├── backend.tf
│   ├── main.tf
│   ├── outputs.tf
│   ├── README.md
│   ├── terraform.tfvars
│   ├── variables.tf
│   └── versions.tf
├── s3
│   ├── main.tf
│   ├── outputs.tf
│   ├── README.md
│   ├── terraform.tfvars
│   ├── variables.tf
│   └── versions.tf
└── vpc
    ├── backend.tf
    ├── main.tf
    ├── outputs.tf
    ├── README.md
    ├── terraform.tfvars
    ├── variables.tf
    └── versions.tf
```
