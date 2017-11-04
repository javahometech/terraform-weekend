provider "aws" {
  region     = "us-west-2"
}

resource "aws_instance" "my-instance" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
}
