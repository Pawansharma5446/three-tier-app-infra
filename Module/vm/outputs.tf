output "vm_ids" {
  description = "The IDs of the virtual machines"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.id }
}

output "vm_public_ip_addresses" {
  description = "The public IP addresses of the virtual machines"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.public_ip_address }
}

output "vm_private_ip_addresses" {
  description = "The private IP addresses of the virtual machines"
  value       = { for k, v in azurerm_linux_virtual_machine.vm : k => v.private_ip_address }
}
