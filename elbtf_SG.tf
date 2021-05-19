#resource for security group-public
resource "aws_security_group" "publictf-elbsg" {
  vpc_id      = "${aws_vpc.vpctf.id}"
  name        = "publictf-elbsg"
  description = "security_group for public subnet"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "6"
    cidr_blocks = ["111.93.29.26/32"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "6"
    cidr_blocks = ["111.93.29.26/32"]
  }
  tags {
    Name  = "publitf-elbsg"
    owner = "saiakhila.srirangam"
  }
}
#resource for load balancer
resource "aws_security_group" "elbtf-SG" {
  vpc_id      = "${aws_vpc.vpctf.id}"
  name        = "elbtf-SG"
  description = "Security group for load balancer"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name  = "ELB_SG"
    Owner = "saiakhila.srirangam"
  }
}
