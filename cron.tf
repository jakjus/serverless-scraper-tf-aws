resource "aws_cloudwatch_event_rule" "run" {
  name                = "jakjus-scraper-run"
  description         = "Run web scraper and send event to Discord."
  schedule_expression = "cron(* * * * ? *)" # Every minute
}

resource "aws_cloudwatch_event_target" "lambda" {
  rule  = aws_cloudwatch_event_rule.run.name
  arn   = aws_lambda_function.scrape.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.scrape.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.run.arn
}
