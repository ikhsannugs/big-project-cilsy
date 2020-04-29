provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_db_instance" "pesbuk-production" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = "db.t2.micro"
  identifier                  = "pesbuk-production"
  name                        = "pesbukdb"
  username                    = "admin"
  password                    = "admin123"
  parameter_group_name        = "default.mysql5.7"
  db_subnet_group_name        = "default-vpc-0d17d3708e8e182ea"
  vpc_security_group_ids      = ["sg-0122e254624c7afca"]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  publicly_accessible         = true
  backup_retention_period     = 35
  #backup_window               = "22:00-23:00"
  #maintenance_window          = "Sat:00:00-Sat:03:00"
  #multi_az                    = true
  skip_final_snapshot         = true
}

resource "aws_db_instance" "blog-production" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = "db.t2.micro"
  identifier                  = "blog-production"
  name                        = "blogdb"
  username                    = "admin"
  password                    = "admin123"
  parameter_group_name        = "default.mysql5.7"
  db_subnet_group_name        = "default-vpc-0d17d3708e8e182ea"
  vpc_security_group_ids      = ["sg-0122e254624c7afca"]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  publicly_accessible         = true
  backup_retention_period     = 35
  #backup_window               = "22:00-23:00"
  #maintenance_window          = "Sat:00:00-Sat:03:00"
  #multi_az                    = true
  skip_final_snapshot         = true
}

resource "aws_db_instance" "apps-stagging" {
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.7"
  instance_class              = "db.t2.micro"
  identifier                  = "apps-stagging"
  name                        = "blogdb"
  username                    = "admin"
  password                    = "admin123"
  parameter_group_name        = "default.mysql5.7"
  db_subnet_group_name        = "default-vpc-0d17d3708e8e182ea"
  vpc_security_group_ids      = ["sg-0122e254624c7afca"]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  publicly_accessible         = true
  backup_retention_period     = 35
  #backup_window               = "22:00-23:00"
  #maintenance_window          = "Sat:00:00-Sat:03:00"
  #multi_az                    = true
  skip_final_snapshot         = true
}

provider "mysql" {
  endpoint = "${aws_db_instance.apps-stagging.endpoint}"
  username = "${aws_db_instance.apps-stagging.username}"
  password = "${aws_db_instance.apps-stagging.password}"
}

resource "mysql_database" "app" {
  name = "pesbukdb"
}