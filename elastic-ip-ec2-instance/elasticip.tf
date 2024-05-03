resource "aws_eip" "lb" {
  instance = aws_instance.web-server.id
  vpc      = true
}