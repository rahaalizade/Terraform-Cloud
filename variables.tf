variable "region" {
  type        = string
  default     = "us-east-1"
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
