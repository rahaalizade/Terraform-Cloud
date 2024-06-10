include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/vpc"
    extra_arguments "custom_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh"
    ]

    required_var_files = ["required_var_files = ["${get_parent_terragrunt_dir()}/configuration/${basename(dirname(get_terragrunt_dir()))}/${basename(get_terragrunt_dir())}/vpc/terraform.tfvars"]"]
  }
}


