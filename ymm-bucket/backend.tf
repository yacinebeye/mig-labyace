terraform {
  backend "s3" {
    bucket = "ymm-miglab-bucket921761936895"
    key    = "firstlab/ymmmiglab/terraform.tfstates"
    region = "us-east-2"
    profile = "teamc-user"
    dynamodb_table = "terraform-lock-ymm"
  }
}