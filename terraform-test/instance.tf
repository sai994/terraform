#public instance


resource "aws_instance" "publictfinstance" {

  ami                    = "ami-0de53d8956e8dcf80"

  instance_type          = "t2.micro"

  subnet_id              = "${aws_subnet.publicsubnettf.id}"

  vpc_security_group_ids = ["${aws_security_group.allow_pub_ssh.id}"]

  key_name               = "newkey"



  tags {

    Name = "publitfinstance"

  }

}



resource "aws_instance" "privateinstance" {

  ami                    = "ami-0de53d8956e8dcf80"

  instance_type          = "t2.micro"

  subnet_id              = "${aws_subnet.privatesubnettf.id}"

  vpc_security_group_ids = ["${aws_security_group.allow_priv_ssh.id}"]

  key_name               = "newkey"



  user_data = <<-EOF

       #!/bin/bash

sudo yum update -y       

sudo yum install httpd -y

       sudo service httpd start

       sudo echo "Server 1" > /var/www/html/index.html

       sudo service httpd restart

       EOF



  tags {

    Name = "privatesubnettf"

  }

}


resource "aws_instance" "public1tfinstance" {

  ami                    = "ami-0de53d8956e8dcf80"

  instance_type          = "t2.micro"

  subnet_id              = "${aws_subnet.publicsubnet1tf.id}"

  vpc_security_group_ids = ["${aws_security_group.allow_pub_ssh.id}"]

  key_name               = "newkey"



  user_data = <<-EOF

       #!/bin/bash

sudo yum update -y

sudo yum install httpd -y

       sudo service httpd start

       sudo echo "Server 1" > /var/www/html/index.html

       sudo service httpd restart

       EOF



  tags {

    Name = "publicsubnettf1"

  }

}

