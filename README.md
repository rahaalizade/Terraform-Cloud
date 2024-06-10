# Terraform Cloud Project
    
This project will create a VPC for you with Public and Private Subnets which it's Internet access has been configured for Private Subnet via NAT GW and for Public Subnet it goes through Internet GW.

1. First of all check your AWS credentials.
you can configure it with your access key and secret key and this command:

`aws configure`

Since it's integrated with terragrunt you have to use these commands:

For variables and configuration, you can do it by creating your `terraform.tfvars` in environment/configuration/[demo/prod]/<Region>/<Module>

1. Go to any component that you want in environment/demo/<Region>/<Module>
2. `terragrunt init`
3. `terragrunt plan`
4. `terragrunt apply`

