resource "azurerm_virtual_network" "vnet" {
  for_each = var.vnet

  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = [each.value.subnet_address_prefix]

  depends_on = [azurerm_virtual_network.vnet]
}
