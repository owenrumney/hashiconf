
resource "aws_instance" "bastion" {

  ami                         = data.aws_ami.bastion-ami.image_id
  instance_type               = var.bastion_instance_type
  subnet_id                   = aws_subnet.acme-public.id
  associate_public_ip_address = true
  key_name                    = data.aws_key_pair.platform-team-keypair.key_name
  source_dest_check           = false

  vpc_security_group_ids = [
    aws_security_group.bastion-sg.id
  ]

  root_block_device {
    delete_on_termination = true
    iops                  = 150
    volume_size           = 50
    volume_type           = "gp2"
  }

  tags = {
    Name    = "bastion"
    OS      = "Ubuntu"
    Managed = "Terraform - Infrastructure"
  }

  depends_on = [aws_security_group.bastion-sg]
}

resource "aws_security_group" "bastion-sg" {
  name   = "bastion-sg"
  vpc_id = aws_vpc.acme-vpc.id

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_security_group_rule" "bastion-sg-ssh-ingress-rule" {

  description = "SSH access for bastion"

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [ "0.0.0.0/0" ]

  security_group_id = aws_security_group.bastion-sg.id

}
