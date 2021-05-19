#resource for security group-public
resource "aws_security_group" "sai-sgtf" {
  vpc_id      = "${aws_vpc.sai-vpctf.id}"
  name        = "public-sg"
  description = "security_group for public subnet"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "6"
    cidr_blocks = ["136.185.111.252/32"]
  }
  tags {
    Name  = "sai-sgtf"
  }
}

