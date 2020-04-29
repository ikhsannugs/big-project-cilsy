provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_db_instance" "pesbuk-production-rep" {
  instance_class              = "db.t2.micro"
  replicate_source_db         = "pesbuk-production"
  identifier                  = "pesbuk-production-rep"
  parameter_group_name        = "default.mysql5.7"
  #db_subnet_group_name        = "default-vpc-0d17d3708e8e182ea"
  vpc_security_group_ids      = ["sg-0122e254624c7afca"]
  auto_minor_version_upgrade  = true
  publicly_accessible         = true
  skip_final_snapshot         = true
}

resource "aws_db_instance" "blog-production-rep" {
  instance_class              = "db.t2.micro"
  replicate_source_db         = "blog-production"
  identifier                  = "blog-production-rep"
  parameter_group_name        = "default.mysql5.7"
  #db_subnet_group_name        = "default-vpc-0d17d3708e8e182ea"
  vpc_security_group_ids      = ["sg-0122e254624c7afca"]
  auto_minor_version_upgrade  = true
  publicly_accessible         = true
  skip_final_snapshot         = true
}

resource "aws_db_instance" "apps-stagging-rep" {
  instance_class              = "db.t2.micro"
  replicate_source_db         = "apps-stagging"
  identifier                  = "apps-stagging-rep"
  parameter_group_name        = "default.mysql5.7"
  #db_subnet_group_name        = "default-vpc-0d17d3708e8e182ea"
  vpc_security_group_ids      = ["sg-0122e254624c7afca"]
  auto_minor_version_upgrade  = true
  publicly_accessible         = true
  skip_final_snapshot         = true
}