# the endpoint of the application load balancer
output "alb_endpoint" {
  value = aws_lb.hulu-alb.dns_name
}