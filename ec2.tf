resource "aws_instance" "web" {
  ami                         = "ami-03a6eaae9938c858c"
  instance_type               = "t2.micro"
  key_name                    = "tf-project"
  subnet_id                   = aws_subnet.public[count.index].id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count                       = 2

  tags = {
    Name = "Web Server"
  }

  provisioner "file" {
    source      = "./tf-project.pem"
    destination = "/home/ec2-user/tf-project.pem"

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("./tf-project.pem")
    }
  }
}

resource "aws_instance" "db" {
  ami                    = "ami-03a6eaae9938c858c"
  instance_type          = "t2.micro"
  key_name               = "tf-project"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}