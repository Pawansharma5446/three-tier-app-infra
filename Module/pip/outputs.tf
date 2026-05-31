output "pip_ids" {
  description = "The IDs of the public IP addresses"
  value       = { for k, v in azurerm_public_ip.pip : k => v.id }
}

output "pip_ip_addresses" {
  description = "The IP addresses of the public IP resources"
  value       = { for k, v in azurerm_public_ip.pip : k => v.ip_address }
}
