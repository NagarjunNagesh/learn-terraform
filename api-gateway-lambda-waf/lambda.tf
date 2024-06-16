resource "aws_lambda_function" "test_lambda" {
  filename         = "code/lambda_function.zip"
  function_name    = "TestlabsAPI"
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = filebase64sha256("code/lambda_function.zip")
}