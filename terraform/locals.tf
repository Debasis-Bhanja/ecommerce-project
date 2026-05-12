locals {
  s3_tags = {
    Environment = var.environment
    Project     = var.project
    Owner       = var.owner
  }
}