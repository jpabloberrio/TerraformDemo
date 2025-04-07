variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "vpc_name" {
  default = "vpc-publica"
}

variable "ami_id" {
  default = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 en us-east-1
}

variable "instance_type" {
  default = "t2.micro"
}