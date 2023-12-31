terraform {
  required_version = "~> 1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.25"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.3"
    }
  }
}
