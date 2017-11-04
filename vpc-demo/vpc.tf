# Provision VPC

resource "aws_vpc" "javahome_vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "JavaHomeVPC"
  }
}

resource "aws_subnet" "subnets" {
  vpc_id            = "${aws_vpc.javahome_vpc.id}"
  count             = "${length(var.azs)}"
  cidr_block        = "${element(var.subnets_cidr,count.index)}"
  availability_zone = "${element(var.azs,count.index)}"
}

resource "aws_internet_gateway" "javahome_igw" {
  vpc_id = "${aws_vpc.javahome_vpc.id}"
}

resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.javahome_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.javahome_igw.id}"
  }

  tags {
    Name = "PublicRT"
  }
}

resource "aws_route_table_association" "public_rt_association" {
  count          = "${length(var.azs)}"
  subnet_id      = "${element(aws_subnet.subnets.*.id,count.index)}"
  route_table_id = "${aws_route_table.public_rt.id}"
}
