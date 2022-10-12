resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = random_pet.lambda_bucket_name.id
  force_destroy = true
}

data "archive_file" "lambda_scrape" {
  type = "zip"

  source_dir  = "${path.module}/jakjus-scrape-case"
  output_path = "${path.module}/jakjus-scrape-case.zip"
}

resource "aws_s3_object" "lambda_scrape" {
  bucket = aws_s3_bucket.lambda_bucket.id

  key    = "jakjus-scrape-case.zip"
  source = data.archive_file.lambda_scrape.output_path

  etag = filemd5(data.archive_file.lambda_scrape.output_path)
}
