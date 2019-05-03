resource "aws_s3_bucket" "main" {
    bucket = "${var.s3_bucket_name}"
    acl = "private"

    tags {
        /*
        Name = "my Bucket"
        Environmet = "Dev"
        */
        env = "${lookup(var.s3_tags, "environment")}"
    }
    region = "${var.s3_regions[0]}"
}