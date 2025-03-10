# Terraform AWS Infrastructure Projects

## Overview

This repository contains a collection of enterprise-grade Terraform modules and configuration files designed to automate the deployment of scalable, secure, and resilient cloud infrastructure on AWS. These projects showcase best practices for Infrastructure as Code (IaC) implementation, emphasizing modularity, security, and operational excellence.

## Repository Structure

The repository is organized into the following main directories:

```
terraform-projects/
├── modules/                # Reusable Terraform modules
│   ├── networking/         # VPC, subnets, security groups, etc.
│   ├── compute/            # EC2, Auto Scaling Groups, etc.
│   ├── database/           # RDS, DynamoDB, etc.
│   ├── security/           # IAM, KMS, etc.
│   └── monitoring/         # CloudWatch, SNS, etc.
├── environments/           # Environment-specific configurations
│   ├── development/
│   ├── staging/
│   └── production/
├── examples/               # Example implementations
└── scripts/                # Utility scripts
```

## Key Features

- **Multi-Environment Architecture**: Separate configurations for development, staging, and production environments.
- **Security-First Approach**: Implementation of AWS security best practices, including least privilege access, encryption, and network isolation.
- **High Availability Design**: Fault-tolerant configurations across multiple availability zones.
- **Cost Optimization**: Resource tagging, right-sizing recommendations, and efficient infrastructure patterns.
- **CI/CD Integration**: Automated testing and deployment workflows.

## Prerequisites

- Terraform v1.0.0 or newer
- AWS CLI v2.0.0 or newer
- AWS account with appropriate permissions
- Python 3.8+ (for utility scripts)

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Alexander77063/terraform-projects.git
   cd terraform-projects
   ```

2. **Configure AWS credentials:**
   ```bash
   aws configure
   ```

3. **Initialize Terraform:**
   ```bash
   cd environments/development
   terraform init
   ```

4. **Review the execution plan:**
   ```bash
   terraform plan
   ```

5. **Apply the configuration:**
   ```bash
   terraform apply
   ```

## Module Documentation

### Networking Module

Provisions a complete AWS networking stack including VPC, public and private subnets, route tables, internet gateway, NAT gateways, and security groups.

```hcl
module "vpc" {
  source = "../../modules/networking"
  
  vpc_name        = "main-vpc"
  vpc_cidr        = "10.0.0.0/16"
  azs             = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  
  enable_nat_gateway = true
  enable_vpn_gateway = false
  
  tags = {
    Environment = "development"
    Project     = "example"
  }
}
```

### Compute Module

Deploys EC2 instances with customizable configuration, including Auto Scaling Groups, Launch Templates, and Load Balancers.

```hcl
module "web_servers" {
  source = "../../modules/compute"
  
  name                   = "web-servers"
  instance_type          = "t3.micro"
  min_size               = 2
  max_size               = 5
  desired_capacity       = 2
  vpc_id                 = module.vpc.vpc_id
  subnet_ids             = module.vpc.private_subnets
  security_group_ids     = [module.vpc.web_sg_id]
  
  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World" > index.html
    nohup python -m SimpleHTTPServer 80 &
  EOF
  
  tags = {
    Environment = "development"
    Service     = "web"
  }
}
```

## Best Practices

This repository follows AWS and Terraform best practices, including:

- State file management with remote backends
- Comprehensive resource tagging
- Separation of environments
- Module versioning
- Detailed documentation
- Secure handling of sensitive data
