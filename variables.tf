variable "region" {
  type = string
  default = "us-east-1"
}

variable "first_bucket" {
  type = string
  description = "here is your first bucket"
}

variable "remote_state_bucket" {
  type = string
  description = "It is the name of the bucket that your terraform state files are gonna store"
}

variable "force_destroy" {}
variable "prevent_destroy" {}
