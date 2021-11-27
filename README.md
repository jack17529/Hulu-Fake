# Hulu-Fake

1. Devised and developed a scalable and fault tolerant Netflix/Hulu like full stack architecture.
2. Used Cutom hardened AMI to launch multiple instances in private subnets.
3. Configured rules for ALB to forward HTTP traffic to the sites hosted on 2 EC2 instances in private subnets.
4. Served videos in S3 buckets using CloudFront (RTMP) as CDN with Edge Locations.
5. Configured CloudWatch alarms with detailed monitoring.

# Infrastructure

1. Used terraform to create the infrastructure provisioning on AWS.

# Pre Commit Hooks

1. `pre-commit run -a` to run pre commit hooks.
