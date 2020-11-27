output "my_ip" {
  value = aws_instance.helloworld.public_ip
}