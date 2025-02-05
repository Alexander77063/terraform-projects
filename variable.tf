# vpc variables
variable "vpc_cidr" {
 default        =  "10.0.0.0/16"
 description    = "vpc cid block"
 type           = string
}

variable "public_subnet_az1_cidr" {
 default        =  "10.0.0.0/24"
 description    = "public subnet az1 cidr block"
 type           = string
}

variable "public_subnet_az2_cidr" {
 default        =  "10.0.1.0/24"
 description    = "public subnet az2 cidr block"
 type           = string
}

variable "private_app_subnet_az1_cidr" {
 default        =  "10.0.2.0/24"
 description    = "private app subnet az1 cidr block"
 type           = string
}

variable "private_app_subnet_az2_cidr" {
 default        =  "10.0.3.0/24"
 description    = "private app subnet az2 cidr block"
 type           = string
}

variable "private_data_subnet_az1_cidr" {
 default        =  "10.0.4.0/24"
 description    = "private data subnet az1 cidr block"
 type           = string
}

variable "private_data_subnet_az2_cidr" {
 default        =  "10.0.5.0/24"
 description    = "private data subnet az2 cidr block"
 type           = string
}

# security group variables
variable "ssh_location" {
 default        =  "82.3.236.102/32"
 description    = "the ip address that can ssh into the ec2 instances"
 type           = string
}

# rds variables
variable "database_snapshot_identifier" {
 default        =  "arn:aws:rds:us-east-1:314146301841:snapshot:dev-rds-db-snapshot"
 description    = "database snapshot arn"
 type           = string
}

variable "database_instance_class" {
 default        =  "db.t3.medium"
 description    = "database instance type"
 type           = string
}
variable "database_instance_identifier" {
 default        =  "dev-rds-db"
 description    = "database instance identifier"
 type           = string
}


 variable "multi_az_deployment" {
 default        =  false
 description    = "create a stanby db instance"
 type           = bool
}

# application load balancer veriables
 variable "ssl_certificate_arn" {
 default        =  "arn:aws:acm:us-east-1:314146301841:certificate/1a1f97f1-9919-4733-8065-16a91eb504ed"
 description    = "ssl certificate arn"
 type           = string
}

# sns topic variables
 variable "operator_email" {
 default        =  "alex_77063@yahoo.com"
 description    = "a valid email address
 type           = string
}