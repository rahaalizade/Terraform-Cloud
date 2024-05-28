variable "bucket_name" {
  description = "The name of my buckets"
}

variable "versioning" {
  description = "Enable versioning for the bucket"
  type        = string
  default     = "Disabled"
}
