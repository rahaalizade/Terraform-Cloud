include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "git::https://github.com/rahaalizade/Terraform-Cloud-Modules.git?ref=v0.1"
    extra_arguments "custom_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh"
    ]
    
    required_var_files = ["${get_parent_terragrunt_dir()}/configuration/${basename(dirname(dirname(get_terragrunt_dir())))}/${basename(dirname(get_terragrunt_dir()))}/${basename(get_terragrunt_dir())}/terraform.tfvars"]
  }
}
