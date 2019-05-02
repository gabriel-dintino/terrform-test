variable "s3_bucket_name" {
  # A comment
  default     = "packt-terraform-section2-bucket"
  description = "Name of S3 bucket"               // description = 1 -> Terraform lo convierte a string
  type        = "string"
}

variable "s3_tags" {
  type = "map"

  default = {
    created_by  = "terraform"
    environment = "test"
  }
}

variable "s3_regions" {
  type    = "list"
  default = ["ap-southeast-2", "us-west-2"]
}
