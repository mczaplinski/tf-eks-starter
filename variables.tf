variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "AWS access key id"
  type        = string
  default     = ""
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "AWS secret access key"
  type        = string
  default     = ""
}
