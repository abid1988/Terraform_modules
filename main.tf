resource "azurerm_resource_group" "rg" {
  for_each = var.rg_name
  name = each.key
  location = each.value
}

resource "azurerm_storage_account" "example" {
    for_each = var.st
  name                     = each.value.name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
depends_on = [ azurerm_resource_group.rg ]
}