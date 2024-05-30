variable "region" {
  type = string
  default = "us-east-1"
}

variable "first_bucket" {
  type = string
  description = "here is your first bucket"
}

variable "force_destroy" {}
