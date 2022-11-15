provider "aws" {
  region = "ap-southeast-1"
}
resource "random_pet" "server_name" {
  length    = 1
}
resource "aws_instance" "app_server" {
  ami           = "ami-0bee6b4258f1faee4"
  instance_type = "t2.micro"
  tags = {
          Name = random_pet.server_name.id
  }
}
output "server_name" {
   value = random_pet.server_name.id
}
