data "azurerm_resource_group" "main" {
  name     = var.rgname
  
}



resource "azurerm_log_analytics_workspace" "example" {
  name                = var.workspacename
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "example" {
  name                = var.insightname
  location            = data.azurerm_resource_group.main.location
  resource_group_name = data.azurerm_resource_group.main.name
  workspace_id        = azurerm_log_analytics_workspace.example.id
  application_type    = "web"
  tags = {
  Dept = "IT"
  ENV = "Dev"
  
  }
}


