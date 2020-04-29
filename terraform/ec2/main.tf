provider "aws" {
  region = "ap-southeast-1"
}

locals {
  instance-userdata = <<EOF
#!/bin/bash
apt-get -y update && apt-get -y install python && apt-get -y install python-pip
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
apt-get update &&  apt-get install apt-transport-https -y
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install kubectl -y
systemctl daemon-reload
systemctl enable docker.service
systemctl restart docker
usermod -aG docker ubuntu
EOF
}

resource "aws_instance" "instance" {
  ami = "ami-09a4a9ce71ff3f20b"
  instance_type = "t2.small"
  key_name = "ikhsan"
  vpc_security_group_ids = ["sg-0958199eb4597994c"]
  subnet_id = "subnet-01de6c133e8792b2a"
  associate_public_ip_address = "true"
  count = "1"
  user_data_base64 = "${base64encode(local.instance-userdata)}"
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "10"
    delete_on_termination = "true"
  }
}
