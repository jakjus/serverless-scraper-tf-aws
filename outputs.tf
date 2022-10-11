output "lambda_bucket_name" {
  description = "Name of the S3 bucket used to store function code."

  value = aws_s3_bucket.lambda_bucket.id
}

output "function_name" {
  description = "Name of the Lambda function."

  value = aws_lambda_function.scrape.function_name
}

output "log_group" {
  description = "Lambda log group"

  value = aws_cloudwatch_log_group.scrape.name
}
