provider "aws" {
  region = "us-east-1"
  shared_credentials_file="/home/ec2-user/.aws/credentials"
}

resource "aws_vpc" "redis_vpc" {
  cidr_block = "${var.my_vpc_cidr}"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "my_redis_vpc"
  }
}

resource "aws_subnet" "redis_subnet_pub1" {
  vpc_id = "${aws_vpc.redis_vpc.id}"
  cidr_block = "${var.my_public_subnet1_cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.my_availability_zone1}"
  tags = {
    Name = "public_subnet1"
  }
}

resource "aws_subnet" "redis_subnet_priv1" {
  vpc_id = "${aws_vpc.redis_vpc.id}"
  cidr_block = "${var.my_private_subnet1_cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.my_availability_zone1}" 
  tags = {
    Name = "private_subnet1"
  }
}

resource "aws_subnet" "redis_subnet_priv2" {
  vpc_id = "${aws_vpc.redis_vpc.id}"
  cidr_block = "${var.my_private_subnet2_cidr}"
  map_public_ip_on_launch = "true"
  availability_zone = "${var.my_availability_zone2}"
  tags = {
    Name = "private_subnet2"
  }
}

resource "aws_instance" "my_ec2_instance_type1" {
  count = "${var.count}"  		
  ami = "${var.my_ec2_instance_ami}"
  key_name = "${var.my_key_pair}"
  instance_type = "${var.my_ec2_instance_type}"
  subnet_id = "${aws_subnet.redis_subnet_priv1.id}"
  tags = {
    Name = "redis_master${count.index + 1}"
  }
}

resource "aws_instance" "my_ec2_instance_type2" {
  count = "${var.count}"
  ami = "${var.my_ec2_instance_ami}"
  key_name = "${var.my_key_pair}"
  instance_type = "${var.my_ec2_instance_type}"
  subnet_id = "${aws_subnet.redis_subnet_priv2.id}"
  tags = {
    Name = "redis_slave${count.index + 1}"
  }
}
