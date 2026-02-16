# AWS Terraform Break-Fix Lab

## Overview

This project demonstrates real-world AWS infrastructure deployment and troubleshooting using Terraform.

Instead of only provisioning infrastructure, this lab simulates operational failures across different layers (service, security, and routing) and demonstrates systematic root cause analysis.

---

## Architecture

The infrastructure includes:

- Custom VPC
- Public Subnet
- Internet Gateway
- Route Table with default route
- Security Group (SSH restricted to my IP)
- EC2 (Amazon Linux 2023)
- Nginx web server installed via user_data
- Modular Terraform structure

---

## Project Structure

aws-terraform-breakfix-lab
├── main.tf
├── variables.tf
├── providers.tf
├── outputs.tf
├── .gitignore
└── modules/
├── vpc/
├── security/
└── ec2/


---

## What This Project Demonstrates

### Infrastructure Engineering

- Terraform modules and reusable structure
- AWS VPC networking
- EC2 provisioning
- Security group management
- Route table configuration
- Infrastructure lifecycle management (apply / destroy)

---

## Simulated Incidents

### 1. Service Failure (Application Layer)
- Nginx manually stopped
- Diagnosed inactive service
- Restored service

### 2. Security Group Misconfiguration (Network Security Layer)
- Restricted HTTP access
- Diagnosed inbound traffic issue
- Restored access

### 3. Route Table Misconfiguration (Routing Layer)
- Removed default route (0.0.0.0/0 → IGW)
- Lost all public connectivity including SSH
- Identified routing issue
- Restored internet access

---

## Troubleshooting Methodology Used

Layer-based debugging approach:

1. Instance status
2. OS/service health
3. Port listening verification
4. Security group rules
5. Route table validation

---

## How to Deploy
terraform init
terraform plan -var="key_name=<your-key>" -var="my_ip=<your-ip>/32"
terraform apply


---

## Security Notes

The following files are excluded from version control:
.terraform/
terraform.tfstate*
*.pem
*.tfvars


Private keys and state files are never committed.

---

## Key Skills Practiced

- AWS Infrastructure
- Terraform (modules, variables, outputs)
- Linux service management
- Cloud networking troubleshooting
- Root cause analysis

---

## Author
Andrius Platform/Infrastructure engineer


