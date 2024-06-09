include "root" {
  path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/network"
    extra_arguments "custom_vars" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh"
    ]

    required_var_files = ["terraform.tfvars"]
  }
}