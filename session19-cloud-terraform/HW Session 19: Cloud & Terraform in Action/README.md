# Session 19: Cloud & Terraform in Action

## Overview

This session demonstrates how to provision, manage, verify, and destroy AWS infrastructure using **Terraform**.

The mini-project provisions:

- AWS VPC
- Public Subnet
- Internet Gateway
- Public Route Table
- Security Group
- EC2 Instance
- S3 Bucket

It also demonstrates Terraform providers, variables, resources, outputs, dependencies, state management, planning, applying, and destroying infrastructure.

---

## Architecture

```text
                         AWS
                          |
             +------------+------------+
             |                         |
        VPC 10.20.0.0/16          S3 Bucket
             |
        Public Subnet
         10.20.1.0/24
             |
        +----+----+
        |         |
       EC2    Route Table
        |         |
   Security    Internet
     Group      Gateway
        |
      Nginx
        |
    HTTP :80
```
## Project Structure
```text
08-mini-project/
├── .gitignore
├── main.tf
├── outputs.tf
├── README.md
├── terraform.tfvars.example
├── variables.tf
└── versions.tf
```

## 1. Terraform Configuration
The project uses the AWS provider and deploys resources in the ap-south-1 region.
Variables
The following variables are used:
```
variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "bucket_name" {
  type = string
}
```
This allows the AWS region, EC2 instance type, and S3 bucket name to be configured without modifying the main infrastructure code.


## 2. Terraform Init and Validate

First, Terraform was initialized:
```
terraform init
```

The configuration was then formatted and validated:
```
terraform fmt
terraform validate
```
The validation completed successfully.
<img width="1522" height="540" alt="image" src="https://github.com/user-attachments/assets/ef5d1d21-54bc-4308-94fa-eae3b55524b2" />


## 3. Terraform Plan
The infrastructure was reviewed before deployment using:
```
terraform plan
```
Terraform generated a plan showing the AWS resources that would be created.
<img width="1540" height="871" alt="image" src="https://github.com/user-attachments/assets/2804812c-0613-4a4c-87fe-cd02a42a0560" />
<img width="1547" height="887" alt="image" src="https://github.com/user-attachments/assets/d5f04529-7970-4722-a011-bf30148dd878" />

## 4. Terraform Apply
The infrastructure was created using:
```
terraform apply
```
Terraform created the required AWS networking resources, EC2 instance, and S3 bucket.
The deployment completed successfully.

<img width="1542" height="888" alt="image" src="https://github.com/user-attachments/assets/c3046911-22a6-428a-b0f1-80636baa4aef" />
<img width="1538" height="882" alt="image" src="https://github.com/user-attachments/assets/d244191e-17ce-47af-a480-0eb769dd783b" />


## 5. Terraform Outputs
Terraform outputs were used to display important information about the deployed infrastructure:
```
terraform output
```
The outputs include:
- EC2 instance ID
- EC2 public IP
- EC2 public DNS
- S3 bucket name
- S3 bucket ARN
- Security group ID
- Subnet ID
- VPC ID
- VPC CIDR
<img width="1535" height="220" alt="image" src="https://github.com/user-attachments/assets/77b205ff-42b5-481b-8d23-cfcfee143892" />


## 6. Terraform State List
Terraform state was checked using:
```
terraform state list
```
The state contains the AWS resources managed by Terraform, including:
```
data.aws_ami.amazon_linux
aws_instance.web
aws_internet_gateway.main
aws_route_table.public
aws_route_table_association.public
aws_s3_bucket.main
aws_security_group.web
aws_subnet.public
```
<img width="1519" height="200" alt="image" src="https://github.com/user-attachments/assets/9c933d50-031e-42b5-969c-e801d5d6f806" />

## 7. Infrastructure Verification
After deployment, the infrastructure was verified to ensure that the resources were successfully created.
<img width="1529" height="496" alt="image" src="https://github.com/user-attachments/assets/eb663fff-f627-4108-a8b7-8f6481d6c3e9" />

## 8. EC2 Web Server
The EC2 instance runs Amazon Linux 2023 with Nginx installed through Terraform user_data.
The instance is deployed in the public subnet and receives a public IP address.
Nginx was configured to display:
<h1>Session 19 - Terraform EC2</h1>

The EC2 web server was successfully accessed through its public IP.
<img width="1917" height="1045" alt="image" src="https://github.com/user-attachments/assets/f27a7446-a214-426c-9370-e7c377889149" />

## 9. AWS Resources
The Terraform configuration creates the following infrastructure:

| Resource | Purpose |
|---|---|
| VPC | Provides the isolated AWS network |
| Public Subnet | Hosts the EC2 instance |
| Internet Gateway | Provides internet connectivity |
| Route Table | Routes public traffic |
| Security Group | Controls EC2 network traffic |
| EC2 Instance | Runs the Nginx web server |
| S3 Bucket | Provides object storage |
| Amazon Linux AMI | Used as the EC2 operating system |


## 10. Terraform Dependencies
Terraform automatically manages dependencies between resources.
For example:
```
VPC
 |
 +-- Public Subnet
 |      |
 |      +-- EC2 Instance
 |
 +-- Internet Gateway
        |
        +-- Route Table
               |
               +-- Public Subnet
```
The EC2 instance depends on the VPC, subnet, and security group.
The route table depends on the Internet Gateway.

## 11. Terraform Destroy
After completing the deployment and verification, the infrastructure was removed using:
```
terraform plan -destroy
```

The destroy plan was reviewed before deletion.
The resources were then destroyed using:
```
terraform destroy
```
Terraform successfully removed the infrastructure created during the session.

destroy
<img width="1535" height="919" alt="image" src="https://github.com/user-attachments/assets/13901ba8-5b7b-4d32-8073-f8fe4c72bc53" />
<img width="1539" height="915" alt="image" src="https://github.com/user-attachments/assets/bcc312f1-5e67-4438-90a6-b7b91b466e51" />
<img width="1533" height="927" alt="image" src="https://github.com/user-attachments/assets/7e9be60f-9122-4871-9538-97d15d4b102e" />

## 12. Conclusion
This session successfully demonstrated an end-to-end AWS Infrastructure as Code workflow using Terraform.
The project provisioned AWS networking infrastructure, an EC2 web server, and an S3 bucket. Terraform commands were used to initialize, validate, plan, deploy, inspect, verify, and finally destroy the infrastructure.
The project demonstrates the fundamental Terraform workflow:
```
Initialize
    ↓
Validate
    ↓
Plan
    ↓
Apply
    ↓
Verify
    ↓
Inspect State
    ↓
Destroy
```
This provides a practical foundation for managing cloud infrastructure using Terraform and AWS.

