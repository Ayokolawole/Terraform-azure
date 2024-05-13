resource "azurerm_resource_group" "example" {
  name     = var.RG
  location = var.region
}

resource "azurerm_key_vault" "example" {
  name                        = var.kv-name
  location                    = azurerm_resource_group.example.location
  resource_group_name         = azurerm_resource_group.example.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name                    = "standard"  

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_management_lock" "key-vault" {
  name       = "aktestingvaultmay"
  scope      = azurerm_resource_group.example.id
  lock_level = "CanNotDelete"
  notes      = "Locked because it's needed by a third-party"
}
