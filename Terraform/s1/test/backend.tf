terraform {
    backend "s3" {
        bucket = "tf-ibm-joey-s3-1"
        key    = "s1/helloworld/terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "tf-ibm-joey-ddb-1"
        encrypt = true
    }
}