variable "bastion_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/17"
}

variable "ssh_access_ip" {
  type = list(any)
  default = [
    "132.24.12.32/32", // Head Office
    "82.12.43.211/32"   // Owen WFH
  ]
}