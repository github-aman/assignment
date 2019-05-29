variable "my_vpc_cidr" {
  description = "CIDR block for the VPC"
  default = "10.0.0.0/16"
}

variable "my_public_subnet1_cidr" {
  description = "CIDR block for public subnet1"
  default = "10.0.0.0/24"
}

variable "my_private_subnet1_cidr" {
  description = "CIDR block for private subnet1"
  default = "10.0.2.0/24"
}

variable "my_private_subnet2_cidr" {
  description = "CIDR block for private subnet2"
  default = "10.0.3.0/24"
}

variable "my_availability_zone1" {
  description = "Availability zone for Public Subnet1"
  default = "us-east-1a"
}

variable "my_availability_zone2" {
  description = "Availability zone for Private Subnet2"
  default = "us-east-1b"
}

variable "my_availability_zone3" {
  description = "Availability zone for Private Subnet2"
  default = "us-east-1c"
}

variable "my_ec2_instance_ami" {
  description = "EC2 instances amis for the redis cluster"
  default = "ami-0080e4c5bc078760e"
}

variable "my_ec2_instance_type" {
  description = "EC2 instances type for the ami-0080e4c5bc078760e"
  default = "t2.micro"
}

variable "count" {
  description = "Number of instances launched inside the subnets"
  default = "3"
}

variable "my_key_pair" {
  description = "Key pair for logging into my EC2 instances"
  default = "virtual_life_devops"
} 
