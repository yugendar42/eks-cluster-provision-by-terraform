provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile # Optional: Remove if not using AWS CLI profiles
}

