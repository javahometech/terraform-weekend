variable "ami" {
  default = "ami-e689729e"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "region" {
  default = "us-west-2"
}

variable "vpc_cidr" {
  default = "10.20.0.0/16"
}

variable "azs" {
  type    = "list"
  default = ["us-west-2a", "us-west-2b"]
}

variable "subnets_cidr" {
  type    = "list"
  default = ["10.20.1.0/24", "10.20.2.0/24"]
}
