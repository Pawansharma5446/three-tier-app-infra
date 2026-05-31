resource "azurerm_network_interface" "nic" {
  for_each = var.nic

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration

    content {
      name                          = ip_configuration.value.name
      subnet_id                     = var.subnet_ids[ip_configuration.value.subnet_key]
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_assoc" {
  for_each = var.nic

  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = var.nsg_ids[each.key]
}
