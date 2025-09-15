resource "azurerm_resource_group" "rg" {
  name     = "resume-rg"
  location = "East US"
}

# Create Storage Account with Static Website Hosting
resource "azurerm_storage_account" "storage" {
  name                     = "resumestorage13092025" # must be globally unique
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_account_static_website" "static_website" {
  storage_account_id = azurerm_storage_account.storage.id
  index_document     = "index.html"
  error_404_document = "404.html"
}


# Create CDN
resource "azurerm_cdn_profile" "cdn" {
  name                = "resume-cdn"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard_ChinaCdn"
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                = "resume-endpoint"
  profile_name        = azurerm_cdn_profile.cdn.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  origin {
    name      = "storage-origin"
    host_name = azurerm_storage_account.storage.primary_web_host
  }
}
