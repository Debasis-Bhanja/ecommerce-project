terraform {
  # when terraform is executed it will checks the infra code i.e. it will compare desired state with Actual State.
  # terraform is usually saved in local. below "backend" S3 part will save the state file in s3 bucket.
  # its called remote state.
  # it will not create bucket, we need to create it using aws cli, manually or other cicd.
  # lock file will also be created (use_lockfile). this is used to avoid deadlock. 
  # so at a time only one user will be able to deploy the changes and once deployed it will unlock the file.
  backend "s3" {
    bucket = "ecommerce-terraform-statefile-sbx"
    key    = "sbx/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    use_lockfile = true
  }
  # terraform provider converts the terraform into the aws (or other cloud) readable format
  # provider calls the aws sevice api to deploy the changes. required_provider has its own version
  # and below is the format for the same.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_version = ">=1.0"
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}