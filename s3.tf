resource "aws_s3_bucket" "main" {
    bucket = "packt-terraform-section2-bucket"
    acl = "private"
    tags {
        Name = "my Bucket"
        Environmet = "Dev"
    }
}