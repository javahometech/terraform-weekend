# Security group created for ELB
resource "aws_security_group" "elb_sg" {
  name        = "allow_http"
  description = "Allow all http traffic"
  vpc_id      = "${aws_vpc.javahome_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_http"
  }
}

# Security group created for ELB
resource "aws_security_group" "elb_webservers" {
  name        = "allow_http_ssh"
  description = "Allow all http traffic"
  vpc_id      = "${aws_vpc.javahome_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_http"
  }
}
