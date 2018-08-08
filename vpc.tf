provider "aws" {
	region = "eu-west-1"
	access_key = "change_all_the_keys"
  	secret_key = "all_the_keys_must_change"
}

resource "aws_vpc" "infrastructure" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "vpc.trolololo"
    Environment = "dev"
  }
}
