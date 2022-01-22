# bizzabo

The project contains 2 folder, **terraform** and **scripts**

---

## Terraform

Terraform folder contains files that creates AWS resources:
 1. VPC
 2. 2 public subnets
 3. 2 prvate subnets
 4. Internet Gateway
 5. Route tables
 6. ALB - with 2 listeners (443, 80)
 7. Security group - To access the ALB from the internet
 8. Route53 DNS - Domain + record pointing to ALB DNS name

 Note - Some of the terraform parameters are configurable. Read vars.tf file for that.


 ## Scripts

 Scripts folder contains 1 python script.
 The script is expecting to get 2 input parameters:
  1. Region - the AWS region to work on
  2. Command - can be any AWS service name (e.g ec2, rds, cloudfront etc.) or the word 'all'
     When supplying the command 'all' - the script will print all the AWS services which are in use in the selected region
     When supplying an AWS service name - the script will print detailed information about the service instances in the selected region