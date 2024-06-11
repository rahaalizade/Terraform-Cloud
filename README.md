# Terraform Cloud Project
    
This project will create a VPC for you with Public and Private Subnets which it's Internet access has been configured for Private Subnet via NAT GW and for Public Subnet it goes through Internet GW.



### It is integrated with `Terragrunt`, `remote module`, and `remote state`.

![vpc](https://github.com/rahaalizade/Terraform-Cloud/assets/53145698/f1c545e0-11f8-4c83-91d7-42fad0945d1a)


For variables and configuration, you can do it by creating your `terraform.tfvars` in environment/configuration/[demo/prod]/<Region>/<Module>

1. First of all check your AWS credentials.
you can configure it with your access key and secret key and this command:

`aws configure`

Since it's integrated with terragrunt you have to use these commands:

2. Go to any component that you want in environment/demo/Region/Module
3. `terragrunt init`
4. `terragrunt plan`
5. `terragrunt apply`

In the end we will have this for our VPC and Subnets with their route tables:
![vpc_topology](https://github.com/rahaalizade/Terraform-Cloud/assets/53145698/24db9bf0-6ef1-4690-9004-a896bd97f95c)
