resource "azurerm_bastion_host" "bastion" {
  for_each = var.bastion

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_address_id
  }
}
