
// Define the provider
provider "aws" {
  region = "us-west-2"
}

// Create the ECS cluster
resource "aws_ecs_cluster" "my_cluster" {
  name = "my-cluster"
}

// Create the task definition
resource "aws_ecs_task_definition" "my_task" {
  family                   = "my-task"
  container_definitions    = <<DEFINITION
[
  {
    "name": "my-container",
    "image": "nginx:latest",
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80,
        "protocol": "tcp"
      }
    ]
  }
]
DEFINITION
}

// Create the ECS service
resource "aws_ecs_service" "my_service" {
  name            = "my-service"
  cluster         = aws_ecs_cluster.my_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  desired_count   = 1

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  network_configuration {
    subnets         = ["subnet-12345678"]
    security_groups = ["sg-12345678"]
  }
}

