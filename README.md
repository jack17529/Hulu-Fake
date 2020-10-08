# Hulu-Fake

Devised and Developed a scalable and highly available and fault tolerant Netflix/Hulu like full stack architecture.  

Configured rules for ALB to forward HTTP traffic to the sites hosted on 2 EC2 instances in private subnets and configured CloudWatch alarms with detailed monitoring. 
Served videos in S3 buckets using CloudFront (RTMP) as CDN with Edge Locations.
