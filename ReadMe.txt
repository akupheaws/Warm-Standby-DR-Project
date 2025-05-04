AWS Multi-Region Infrastructure with Terraform
This project provisions a highly available, disaster-resilient web application infrastructure across two AWS regions—us-east-1 (primary) and us-west-2 (secondary)—using Terraform.

📁 Project Structure
The infrastructure is organized into modular phases:

Phase 1: VPC & Networking – Sets up VPCs, subnets, NAT gateways, and route tables.

Phase 2: EC2 & Auto Scaling – Deploys EC2 instances with launch templates and auto scaling groups.

Phase 3: Load Balancers & RDS – Configures Application Load Balancers and RDS instances.

Phase 4: Backup & Disaster Recovery – Implements AWS Backup plans with cross-region replication.

Phase 5: Route 53, CloudFront & WAF – Establishes DNS failover, content delivery, and web application firewall.
Awesome Open Source
+16
Medium
+16
GitLab
+16

🚀 Getting Started
Prerequisites
Terraform installed

AWS CLI configured with appropriate credentials

An existing AWS Key Pair

Registered domain name in Route 53

Installation
Clone the repository:

bash
Copy
Edit
git clone https://github.com/yourusername/aws-multi-region-terraform.git
cd aws-multi-region-terraform
Initialize Terraform:

bash
Copy
Edit
terraform init
Review and customize variables:

Edit variables.tf to set values like project_name, key_pair_name, and domain_name.

Apply the configuration:

bash
Copy
Edit
terraform apply
Confirm the action when prompted.

🧱 Modules Overview
VPC Module: Creates VPCs, subnets, and networking components in both regions.

EC2 Module: Defines launch templates and auto scaling groups for web and application tiers.

Load Balancer Module: Sets up Application Load Balancers and target groups.

RDS Module: Provisioning of Multi-AZ RDS instances with subnet groups.

Backup Module: Configures AWS Backup plans and vaults with cross-region replication.

Route 53 Module: Establishes DNS records with health checks for failover.

CloudFront Module: Deploys a CDN distribution for content delivery.

WAF Module: Applies web application firewall rules to protect the application.

🛡️ Security Considerations
IAM Roles: Ensure that the necessary IAM roles and policies are in place for services like AWS Backup and RDS.

Security Groups: Review and customize security group rules to fit your security requirements.

Key Management: Manage your AWS Key Pairs securely and avoid hardcoding sensitive information.

📄 License
This project is licensed under the MIT License.