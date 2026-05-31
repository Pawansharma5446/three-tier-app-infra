output "vnet_ids" {
  description = "The IDs of the virtual networks"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.id }
}

output "vnet_names" {
  description = "The names of the virtual networks"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.name }
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
}
