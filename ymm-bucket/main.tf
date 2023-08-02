resource "aws_s3_bucket" "ymm-migration-lab-bucket" {
    bucket = "ymm-miglab-bucket921761936895"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "ymm-miglab-bucket921761936895"
        # Environment = prod
    }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.ymm-migration-lab-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl_ymm" {
  name           = "terraform-lock-ymm"
  read_capacity  = 3
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock-ymm"
  }
}