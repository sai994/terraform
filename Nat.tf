#eip for nat
resource "aws_eip" "eiptf" {
  vpc      = true

  tags = {
        Name = "eiptf"
	}
}

#nat gateway

resource "aws_nat_gateway" "NATtf" {
  allocation_id = "${aws_eip.eiptf.id}"
  subnet_id     = "${aws_subnet.publicsubnettf.id}"
  depends_on  = ["aws_internet_gateway.gwtf"]

  tags = {
        Name = "NATtf"
        Owner = "saiakhila.srirangam"
        Environment = "Testing"
        Project = "Learning"

  }
}


# private route table

resource "aws_route_table" "privRT" {
  vpc_id = "${aws_vpc.vpctf.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NATtf.id}"
  }
 tags = {
        Name = "privRT"
        Owner = "saiakhila.srirangam"
        Environment = "Testing"
        Project = "Learning"

  }
}

#route  table association

resource "aws_route_table_association" "privatesubnettf" {
  subnet_id      = "${aws_subnet.privatesubnettf.id}"
  route_table_id = "${aws_route_table.privRT.id}"
}
