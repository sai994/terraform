resource aws_vpc "sai-vpctf"
{
cidr_block       = "10.0.0.0/16"
instance_tenancy = "default"
enable_dns_hostnames = "true"
enable_dns_support = "true"
enable_classiclink = "false"

tags = {
Name = "sai-vpctf"
}
}
resource "aws_subnet" "sai-pubtf" {
  #refering the values, similar to REF function in cloud formation template
  vpc_id                  = "${aws_vpc.sai-vpctf.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags {
    Name  = "sai-pubtf"
  }
}