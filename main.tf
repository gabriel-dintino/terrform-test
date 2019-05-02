provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami                    = "ami-0de53d8956e8dcf80"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.sg-terraform.id}"]

  user_data = <<EOF
        #!/bin/bash
        yum install httpd -y
        yum update -y
        service httpd start
        chkconfig httpd on
        echo "Hello, World" > /var/www/html/index.html
        EOF
  tags {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "sg-terraform" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "http-sg"
  }
}
