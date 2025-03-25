# dynamic default provider
provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.default.shared_credentials_file]
}

# dynamic tagged/aliased provider
provider "aws" {
  region                   = "us-east-1"
  alias                    = "dynamodb-admin"
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.aliases["123456789012_DB_ADMIN"].shared_credentials_file]
}

# dynamic tagged/aliased provider
provider "aws" {
  region                   = "us-east-1"
  alias                    = "ec2-provisioner"
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.aliases["123456789012_EC2_PROV"].shared_credentials_file]
}

# leveraging the default provider
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.3.0"

  bucket = "app-team-shinra-dev"
  acl    = "private"

  force_destroy            = true
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

# leveraging the aliased provider for dynamodb
module "dynamodb_table" {
  providers = {
    aws = aws.dynamodb-admin
  }

  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "4.2.0"

  name     = "my-table"
  hash_key = "id"

  attributes = [
    {
      name = "id"
      type = "N"
    }
  ]
}

# leveraging the aliased provider for ec2
resource "aws_instance" "simple_ec2" {
  provider      = aws.ec2-provisioner
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
}
