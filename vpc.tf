module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.68.0"
  # insert the 15 required variables here

  name = "hulu"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  # enable_vpn_gateway = true

  igw_tags = {
    Name        = "hulu-ig"
    Terraform   = "true"
    Environment = "dev"
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
