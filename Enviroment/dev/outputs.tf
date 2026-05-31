output "resource_group_names" {
  value = module.resource_group.resource_group_names
}

output "vnet_names" {
  value = module.vnet.vnet_names
}

output "subnet_ids" {
  value = module.vnet.subnet_ids
}

output "vm_public_ip_addresses" {
  value = module.vm.vm_public_ip_addresses
}

output "vm_private_ip_addresses" {
  value = module.vm.vm_private_ip_addresses
}

output "bastion_dns_names" {
  value = module.bastion.bastion_dns_names
}
