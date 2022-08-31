variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "s3-bucket-name" {
  type    = string
  default = "presigned-bucket-example-ep"
  #user must specify unique s3 bucket name.
}

/*
variable "aws-account-number" {
  type = number
}
*/