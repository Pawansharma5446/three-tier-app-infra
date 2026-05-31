output "resource_group_ids" {
  description = "The IDs of the resource groups"
  value       = { for k, v in azurerm_resource_group.rg : k => v.id }
}

output "resource_group_names" {
  description = "The names of the resource groups"
  value       = { for k, v in azurerm_resource_group.rg : k => v.name }
}
