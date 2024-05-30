variable "region" {
  type        = string
  default     = "us-west-2"
}

variable "remote_state_bucket" {
  type        = string
  description = "here is your first bucket"
  default     = "remote-state-bucket"
}

variable "force_destroy" {
  type        = bool
  default     = false
}
