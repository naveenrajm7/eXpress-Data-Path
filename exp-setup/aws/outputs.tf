output "trex_public_ip" {
  description = "Public IP address of tRex instance"
  value       = aws_instance.trex.public_ip
}

output "dut_public_ip" {
  description = "Public IP address of DUT instance"
  value       = aws_instance.xdp_dut.public_ip
}

output "trex_private_ip" {
  description = "Private IP address of tRex instance"
  value       = aws_instance.trex.private_ip
}

output "dut_private_ip" {
  description = "Private IP address of DUT instance"
  value       = aws_instance.xdp_dut.private_ip
}