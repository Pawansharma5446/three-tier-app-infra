output "bastion_ids" {
  description = "The IDs of the bastion hosts"
  value       = { for k, v in azurerm_bastion_host.bastion : k => v.id }
}

output "bastion_dns_names" {
  description = "The DNS names of the bastion hosts"
  value       = { for k, v in azurerm_bastion_host.bastion : k => v.dns_name }
}
