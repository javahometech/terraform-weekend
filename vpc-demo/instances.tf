# resource "aws_instance" "instance1" {
#   count = "${length(var.azs)}"
#   ami = "${var.ami}"
#   instance_type = "${var.instance_type}"
#   subnet_id  = "${aws_subnet.subnets.*.id}"
# }
resource "aws_instance" "instances" {
  count         = "${length(var.azs)}"
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${element(aws_subnet.subnets.*.id,count.index)}"
  user_data     = "${file("install-apache.sh")}"
  security_groups = ["${aws_security_group.elb_webservers.id}"]
  associate_public_ip_address = true
}

output "subnet_ids" {
  value = "${aws_subnet.subnets.*.id}"
}

output "instance_ids" {
  value = "${aws_instance.instances.*.id}"
}
