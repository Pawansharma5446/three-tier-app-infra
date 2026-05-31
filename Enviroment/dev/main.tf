module "resource_group" {
  source = "../../Module/Resource_group"

  resource_group = var.resource_group
}

module "vnet" {
  source = "../../Module/vnet"

  depends_on = [module.resource_group]

  vnet    = var.vnet
  subnets = var.subnets
}

module "nsg" {
  source = "../../Module/nsg"

  depends_on = [module.resource_group]

  nsg = var.nsg
}

module "nic" {
  source = "../../Module/nic"

  depends_on = [
    module.vnet,
    module.nsg
  ]

  nic        = var.nic
  subnet_ids = module.vnet.subnet_ids
  nsg_ids    = module.nsg.nsg_ids
}

module "vm" {
  source = "../../Module/vm"

  depends_on = [module.nic]

  vm  = var.vm
  nic = module.nic.nic_ids
}

module "pip" {
  source = "../../Module/pip"

  depends_on = [module.resource_group]

  pip = var.pip
}

module "bastion" {
  source = "../../Module/bastion"

  depends_on = [
    module.vnet,
    module.pip
  ]

  bastion              = var.bastion
  subnet_id            = module.vnet.subnet_ids["bastion"]
  public_ip_address_id = module.pip.pip_ids["bastion_pip"]
}

