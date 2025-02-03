# configure aws provider
provider "aws" {
  region = "us-east-1"
  profile = "terraform-user"
}

# stores the terraform states file in s3
terraform {
  backend "s3" {
    bucket = "alex-terraform-remote-state"
    key    = "terraform.tfstate.dev"
    region = "us-east-1"
    profile = "terraform-user"
  }
}
