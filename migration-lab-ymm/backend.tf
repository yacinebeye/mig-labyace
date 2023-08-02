# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket  = "ymm-miglab-bucket921761936895"
    key     = "firstlab/ymmmiglab/miglabtfstates/terraform.tfstates"
    region  = "us-east-2"
    profile = "teamc-user"
  }
}