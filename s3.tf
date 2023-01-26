resource "aws_s3_bucket" "root_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.bucket_name}"

  website {
    redirect_all_requests_to = var.domain_name
  }
}