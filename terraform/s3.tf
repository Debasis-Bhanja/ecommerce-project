# Create a VPC, that is where we will see "resource" keyword. aws_vps is resource type.
# anywhere we have to refer to aws_vpc, we need to do aws_vpc.example.id. 
# example ec2_host_id = aws_vpc.example.id

#creating s3 bucket
# aws_s3_bucket is the aws s3 api for s3 bucket. 
# "ecomm_commons" is the variable that will be referenced in other terraform code.
# like for bucket versioning we use - aws_s3_bucket_versioning.


# common bucket to store common files like scripts
resource "aws_s3_bucket" "ecomm_commons" {
  bucket = "ecommerce-commons-bkt-${var.environment}"

  tags = merge (
    local.s3_tags,
    {
    Name = "ecommerce-commons-bkt-${var.environment}" 
    }
  )
}

resource "aws_s3_bucket_versioning" "ecomm_commons_versioning"{
  bucket = aws_s3_bucket.ecomm_commons.id
  
    versioning_configuration {
    status="Enabled"
  }
}

# raw data bucket to store the raw data files
resource "aws_s3_bucket" "ecomm_raw_data_bkt" {
  bucket = "ecommerce-raw-datafile-${var.environment}"

  tags = merge (
    local.s3_tags ,
    {
    Name = "ecommerce-raw-datafile-bkt-${var.environment}"
  }
  )
}

resource "aws_s3_bucket_versioning" "ecomm_raw_bkt_versioning" {
  bucket = aws_s3_bucket.ecomm_raw_data_bkt.id

  versioning_configuration {
    status = "Enabled"
  }
}

# derived data bucket to store files after transformations are applied.
resource "aws_s3_bucket" "ecomm_derive_bkt" {
  bucket = "ecommerce-derive-datafile-${var.environment}"

  tags = merge (
    local.s3_tags,
    {
    Name = "ecommerce-derive-datafile-bkt-${var.environment}"
  }
  )
}

resource "aws_s3_bucket_versioning" "ecomm_derive_data_versioning" {
  bucket = aws_s3_bucket.ecomm_derive_bkt.id

  versioning_configuration {
    status = "Enabled"
  }
}