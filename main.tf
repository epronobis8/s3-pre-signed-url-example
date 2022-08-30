provider "aws" {
  #region is set as a variable
  region = var.aws_region
}

#s3 bucket
resource "aws_s3_bucket" "presigned-bucket" {
  bucket = var.s3-bucket-name

  tags = {
    IaC         = "True"
    Environment = "test"
  }
}

#iam users
resource "aws_iam_user" "get" {
  name = "presigned-get-objects"
}

resource "aws_iam_user" "put" {
  name = "presigned-put-objects"
}

resource "aws_iam_user_policy" "get" {
  name = "get-object"
  user = aws_iam_user.get.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : "s3:GetObject",
        "Resource" : "${aws_s3_bucket.presigned-bucket.arn}/*"
      }
    ]
  })
}

resource "aws_iam_user_policy" "put" {
  name = "put-object"
  user = aws_iam_user.put.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : "s3:PutObject",
        "Resource" : "${aws_s3_bucket.presigned-bucket.arn}/*"
      }
    ]
  })
}

resource "aws_iam_access_key" "get" {
  user = aws_iam_user.get.name
}

resource "aws_iam_access_key" "put" {
  user = aws_iam_user.put.name
}