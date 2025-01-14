terraform {
  backend "s3" {
    bucket = "YOUR-S3-OR-MINIO-BUCKET-NAME"
    key    = "folder-name/terraform.tfstate"

    endpoint = "EITHER-S3-OR-MINIO-ENDPOINT"

    region                      = "YOUR-S3-REGION"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
    skip_requesting_account_id  = true
  }
}
