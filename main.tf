locals {
  key_name         = "devops"
  private_key_path = "~/Downloads/devops.pem"
}

resource "aws_instance" "hulu-home" {

  ami                         = "ami-0885b1f6bd170450c"
  subnet_id                   = module.vpc.private_subnets[0]
  user_data                   = <<-EOF
              #!/bin/bash
              apt update
              apt install -y apache2
              echo "<h1><b>Welcome to Home!</b></h1>" > /var/www/html/index.html
              cd /var/www/html
              mkdir home
              cp ./index.html ./home/
              service apache2 reload
              EOF
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.apache.id]
  key_name                    = local.key_name

  tags = {
    Name = "hulu-home"
    Env  = "dev"
  }
}

resource "aws_instance" "hulu-stream" {

  ami                         = "ami-0885b1f6bd170450c"
  subnet_id                   = module.vpc.private_subnets[1]
  user_data                   = <<-EOF
              #!/bin/bash
              apt update
              apt install -y apache2
              echo "<h1><b>Welcome to Stream!</b></h1>" > /var/www/html/index.html
              cd /var/www/html
              mkdir stream
              cp ./index.html ./stream/
              service apache2 reload
              EOF
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.apache.id]
  key_name                    = local.key_name

  tags = {
    Name = "hulu-stream"
    Env  = "dev"
  }
}
