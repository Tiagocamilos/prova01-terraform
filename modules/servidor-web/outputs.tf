output "ip_publico" {
  value = aws_instance.web.public_ip
}

output "dns_publico" {
  value = aws_instance.web.public_dns
}