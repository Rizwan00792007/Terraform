terraform {
  required_providers {
#  !! in place of aws we can give any provider name but in next step i.e provider we have to use same name there !! 
    aws = {                
      source = "hashicorp/aws"
      version = "~> 6.27"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  profile = "rizwan"
}
