//////////////////////////////////////////////////////////
// Provider configurations for Account ID: 123456789012 //
//////////////////////////////////////////////////////////
# dynamic tagged/aliased provider
provider "aws" {
  region                   = "us-east-1"
  alias                    = "s3-admin-123456789012"
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.aliases["123456789012_S3_ADMIN"].shared_credentials_file]
}

# dynamic tagged/aliased provider
provider "aws" {
  region                   = "us-east-1"
  alias                    = "dynamodb-admin-123456789012"
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.aliases["123456789012_DB_ADMIN"].shared_credentials_file]
}

# dynamic tagged/aliased provider
provider "aws" {
  region                   = "us-east-1"
  alias                    = "ec2-provisioner-123456789012"
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.aliases["123456789012_EC2_PROV"].shared_credentials_file]
}

# leveraging the default provider
module "s3_bucket_123456789012" {
  providers = {
    aws = aws.s3-admin-123456789012
  }

  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.3.0"

  bucket = "app-team-shinra-00-dev"
  acl    = "private"

  force_destroy            = true
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

# leveraging the aliased provider for dynamodb
module "dynamodb_table_123456789012" {
  providers = {
    aws = aws.dynamodb-admin-123456789012
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
resource "aws_instance" "simple_ec2_123456789012" {
  provider      = aws.ec2-provisioner-123456789012
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
}

//////////////////////////////////////////////////////////
// Provider configurations for Account ID: 210987654321 //
//////////////////////////////////////////////////////////
# dynamic tagged/aliased provider
provider "aws" {
  region                   = "us-east-1"
  alias                    = "s3-admin-210987654321"
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.aliases["210987654321_S3_ADMIN"].shared_credentials_file]
}

# dynamic tagged/aliased provider
provider "aws" {
  region                   = "us-east-1"
  alias                    = "dynamodb-admin-210987654321"
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.aliases["210987654321_DB_ADMIN"].shared_credentials_file]
}

# dynamic tagged/aliased provider
provider "aws" {
  region                   = "us-east-1"
  alias                    = "ec2-provisioner-210987654321"
  shared_credentials_files = [var.tfc_vault_backed_aws_dynamic_credentials.aliases["210987654321_EC2_PROV"].shared_credentials_file]
}

# leveraging the default provider
module "s3_bucket_210987654321" {
  providers = {
    aws = aws.s3-admin-210987654321
  }

  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.3.0"

  bucket = "app-team-cosmo-00-dev"
  acl    = "private"

  force_destroy            = true
  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

# leveraging the aliased provider for dynamodb
module "dynamodb_table_210987654321" {
  providers = {
    aws = aws.dynamodb-admin-210987654321
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
resource "aws_instance" "simple_ec2_210987654321" {
  provider      = aws.ec2-provisioner-210987654321
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
}
