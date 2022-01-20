provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.rgname
  location = var.location
}

module "appseviceplan" {
  source = "./modules/appseviceplan"
}

resource "azurerm_app_service" "example" {
  count = 2
  name                = "apsvc-ads-dev-001$(count.index)"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = ["${module.appseviceplan.appserviceplan-id}"]
  tags = {
    Dept: "IT"
    Env: "Dev"
  }

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}