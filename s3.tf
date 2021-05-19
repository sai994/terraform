resource "aws_s3_bucket" "example" {
 bucket = "akhila-s3-test"
 acl = "private"
  tags {
   Name = "akhila-s3-test"
  Owner = "saiakhila.srirangam"
  Project = "Learning"
  Environment = "Testing"
 }
}
