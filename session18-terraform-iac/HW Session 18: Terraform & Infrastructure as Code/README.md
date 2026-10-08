# Terraform & Infrastructure as Code

## Task 1: Terraform S3 Demo

### Objective

Create and manage an AWS S3 bucket using Terraform and demonstrate the complete Infrastructure as Code (IaC) workflow.


### terraform init, terraform fmt, terraform validate
- `terraform init` initializes the Terraform project and downloads the required providers.
- `terraform fmt` formats the Terraform configuration files.
- `terraform validate` checks whether the Terraform configuration is valid.
  
<img width="1556" height="438" alt="image" src="https://github.com/user-attachments/assets/97f7ed8e-ebd0-4cf4-800a-30969658c9eb" />


### terraform plan
The `terraform plan` command shows the changes Terraform intends to make before applying them.

<img width="1549" height="885" alt="image" src="https://github.com/user-attachments/assets/75ac92f7-f171-485f-9cb4-0ef76b07abc8" />
<img width="1571" height="855" alt="image" src="https://github.com/user-attachments/assets/bcb988a6-3545-4b28-a82f-dcc6b8c06616" />

### terraform apply
The `terraform apply` command creates the infrastructure defined in the Terraform configuration.
The S3 bucket was successfully created.

<img width="1573" height="902" alt="image" src="https://github.com/user-attachments/assets/27d39be0-3076-4ac6-b3f1-7bbad73c8bdb" />
<img width="1578" height="907" alt="image" src="https://github.com/user-attachments/assets/4362b879-fc10-4c08-a26a-afa8c33b1b2e" />


### terraform show, terraform output
- The `terraform show` command displays the current Terraform state and the resources managed by Terraform.
- The `terraform output` command displays the output values defined in outputs.tf.
<img width="1566" height="915" alt="image" src="https://github.com/user-attachments/assets/e1a67edd-f82a-4553-9527-4e964116e4fc" />
<img width="1586" height="821" alt="image" src="https://github.com/user-attachments/assets/a362055f-e950-435f-a497-3ba881b7b4e0" />


### terraform destroy
The `terraform destroy` command removes the infrastructure managed by Terraform.
The S3 bucket was successfully destroyed after confirmation.

<img width="1571" height="919" alt="image" src="https://github.com/user-attachments/assets/6b4de966-e822-40a6-aa43-7b566b6d9968" />
<img width="1571" height="906" alt="image" src="https://github.com/user-attachments/assets/f0a00d3f-efb1-4b01-b552-ebb9ebdb7876" />
