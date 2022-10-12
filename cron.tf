resource "aws_cloudwatch_event_rule" "run" {
  name                = "jakjus-scraper-run"
  description         = "Run web scraper and send event to Discord."
  schedule_expression = "cron(* * * * ? *)" # Every minute
}

resource "aws_cloudwatch_event_target" "lambda" {
  rule  = aws_cloudwatch_event_rule.run.name
  arn   = aws_lambda_function.scrape.arn
  value = aws_lambda_function.scrape.function_name
}
