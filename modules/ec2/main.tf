data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]

  key_name = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              dnf install nginx -y
              systemctl enable nginx
              systemctl start nginx
              EOF
}
