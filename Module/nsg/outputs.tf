output "nsg_ids" {
  description = "The IDs of the network security groups"
  value       = { for k, v in azurerm_network_security_group.nsg : k => v.id }
}

output "nsg_names" {
  description = "The names of the network security groups"
  value       = { for k, v in azurerm_network_security_group.nsg : k => v.name }
}
