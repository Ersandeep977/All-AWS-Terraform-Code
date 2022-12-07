resource "aws_s3_bucket" "onebucket" {
  bucket        = "sandeep-kumar-patel-testing-s3-with-terraform"
  acl           = "private"
  force_destroy = true
  object_lock_enabled = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
  versioning {
    enabled = true
  }
  tags = {
    Name        = "Sandeep_bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket   = aws_s3_bucket.onebucket.id
  for_each = fileset("./Data_file/", "**")
  key = each.value
  source = "./Data_file/${each.value}"
  etag = filemd5("./Data_file/${each.value}")

}
