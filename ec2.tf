resource "aws_instance" "sai-ec2tf" {
    ami       = "ami-0de53d8956e8dcf80"
    instance_type          = "t2.micro"
    subnet_id              = "${aws_subnet.sai-pubtf.id}"
    vpc_security_group_ids = ["${aws_security_group.sai-sgtf.id}"]
  tags {
      Name = "sai-ec2tf"
    }
