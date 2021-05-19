#security group for public

resource "aws_security_group" "allow_pub_ssh" {
  name        = "allow_pub_ssh"
  description = "security group allow sall ssh and egress traffic"
  vpc_id      = "${aws_vpc.vpctf.id}"



  ingress {
    # SSH (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["111.93.29.26/32"]
  }

ingress {
    # HTTP (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["111.93.29.26/32"]
  }



  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
tags = {
Name = "allow_pub_ssh"
Owner = "saiakhila.srirangam"
Environment = "Testing"
Project = "Learning"

}
}


#security group for private


resource "aws_security_group" "allow_priv_ssh" {
  name        = "allow_priv_ssh"
  description = "security group allows all ssh and egress traffic"
  vpc_id      = "${aws_vpc.vpctf.id}"



  ingress {
    # SSH (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

ingress {
    # HTTP (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }



  ingress {
    from_port       = 1024
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["10.0.0.0/16"]
  }

  egress {
    from_port       = 0
    to_port         = 65535
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
}
tags = {
Name = "allow_priv_ssh"
Owner = "saiakhila.srirangam"
Environment = "Testing"
Project = "Learning"


}

}
