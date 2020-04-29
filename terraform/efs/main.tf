provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_efs_file_system" "efs-k8s" {
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   lifecycle_policy {
    transition_to_ia = "AFTER_7_DAYS"
  }
  tags = {
    Name = "K8S"
  }
   encrypted = "false"
 }

resource "aws_efs_mount_target" "efs-k8s" {
  file_system_id  = "${aws_efs_file_system.efs-k8s.id}"
  subnet_id       = "subnet-0576bd7594b462531"
  security_groups = ["sg-049571edbb25db347", "sg-07e8c39a0f07d6ddb"]
}