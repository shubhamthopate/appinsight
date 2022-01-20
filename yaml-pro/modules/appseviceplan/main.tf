



resource "azurerm_app_service_plan" "main" {
  name                = var.appservicename
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  kind                = "Linux"
  reserved            = true
  tags = {
  Dept = "IT"
  ENV = "Dev"
 }

  sku {
    tier = "Basic"
    size = "B1"
  }
}


