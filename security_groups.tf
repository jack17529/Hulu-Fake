resource "aws_security_group" "apache" {

  name        = "dev-apache"
  description = "Allow Apache2 traffic"
  vpc_id      = module.vpc.vpc_id

  # for ssh
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # for apache
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # -1 means all protocols
  # all ip addresses are allowed according to cidr block.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "prod-apache" {

  name        = "prod-apache"
  description = "Allow Apache2 traffic"
  vpc_id      = module.vpc.vpc_id

  # for apache
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # -1 means all protocols
  # all ip addresses are allowed according to cidr block.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}