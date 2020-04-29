provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "nugroho-state-store"
  acl = "private"
  versioning {
    enabled = true
  }

  tags {
    Name = "nugroho-state-store"
  }

}