
provider "aws" {
  region = "us-east-1"
}

resource "aws_lambda_function" "my_lambda_function" {
  function_name = "my-node-lambda"
  runtime = "nodejs14.x"
  handler = "index.handler"
  timeout = 10
  memory_size = 128

  role = aws_iam_role.lambda_role.arn

  filename = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")
}

resource "aws_iam_role" "lambda_role" {
  name = "my-lambda-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
