remote_state {
  backend = "s3"
  config = {
      bucket = "remote-state-bucket-raha"
      key    = "stateFolder/demo/us-east-1/network.tfstate"
      region = "us-east-1"
      dynamodb_table = "remote-state-bucket-raha"
  }
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "remote-state-bucket-raha"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "remote-state-bucket-raha"
  }
}
EOF
}