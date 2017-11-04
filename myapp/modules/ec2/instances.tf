resource "aws_instance" "instances" {
  ami           = "${var.ami}"
  count         = "${var.instances_count}"
  instance_type = "${var.instance_type}"
}
