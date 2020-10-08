# Hulu-Fake

Devised and Developed a scalable and highly available and fault tolerant Netflix/Hulu like full stack architecture.  

Used Cutom AMI to launch multiple instances in private subnets.  
Configured rules for ALB to forward HTTP traffic to the sites hosted on 2 EC2 instances in private subnets.   
Served videos in S3 buckets using CloudFront (RTMP) as CDN with Edge Locations.  
Configured CloudWatch alarms with detailed monitoring.  
