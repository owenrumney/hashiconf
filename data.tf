// Most recent Ubuntu 20.04 from Canonical
data "aws_ami" "bastion-ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}



// KeyPair already exists in the region
data "aws_key_pair" "platform-team-keypair" {
  key_name = "platform-team"
  filter {
    name   = "tag:Team"
    values = ["platform"]
  }
}
