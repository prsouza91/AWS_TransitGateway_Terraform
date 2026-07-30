terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.47.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "prsouza"
      managed-by = "terraform"
    }
  }
}

provider "aws" {
  alias  = "saopaulo"
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "prsouza"
      managed-by = "terraform"

    }
  }
}
