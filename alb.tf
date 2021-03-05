resource "aws_lb" "hulu-alb" {
  name               = "hulu-alb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.prod-apache.id]
  subnets            = module.vpc.public_subnets

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "hulu-home-tg" {
  name     = "hulu-home-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_target_group" "hulu-stream-tg" {
  name     = "hulu-stream-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

resource "aws_lb_target_group_attachment" "hulu-home-attachment" {
  target_group_arn = aws_lb_target_group.hulu-home-tg.arn
  target_id        = aws_instance.hulu-home.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "hulu-stream-attachment" {
  target_group_arn = aws_lb_target_group.hulu-stream-tg.arn
  target_id        = aws_instance.hulu-stream.id
  port             = 80
}

resource "aws_lb_listener" "hulu-home-listener" {
  load_balancer_arn = aws_lb.hulu-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.hulu-home-tg.id
    type             = "forward"
  }
}

resource "aws_lb_listener_rule" "hulu-home-rule" {
  listener_arn = aws_lb_listener.hulu-home-listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hulu-home-tg.arn
  }

  condition {
    path_pattern {
      values = ["/home/*"]
    }
  }
}

resource "aws_lb_listener_rule" "hulu-stream-rule" {
  listener_arn = aws_lb_listener.hulu-home-listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hulu-stream-tg.arn
  }

  condition {
    path_pattern {
      values = ["/stream/*"]
    }
  }
}