resource "aws_lb" "web-server-alb" {
  name               = "hello-world-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group-alb.id]
  subnets            = aws_subnet.alb-public-subnet[*].id

  enable_deletion_protection = var.ALB_TERMINATION_PROTECTION_ENABLED

  tags = {
    Name = "hello-world-alb"
  }
}

resource "aws_lb_listener" "listener-http" {
  load_balancer_arn = aws_lb.web-server-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hello-world-alb-target-group.arn
  }
}

resource "aws_lb_listener" "listener-https" {
  load_balancer_arn = aws_lb.web-server-alb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn = var.ALB_HTTPS_CERTIFICATE
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.hello-world-alb-target-group.arn
  }
}

resource "aws_lb_target_group" "hello-world-alb-target-group" {
  name     = "hello-world-tg"
  port     = 80
  protocol = "HTTP"
  health_check {
    enabled = true
    path = "/health"
  }
  vpc_id   = aws_vpc.main-vpc.id
}
