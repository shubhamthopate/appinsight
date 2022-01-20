data "azurerm_resource_group" "main" {
  name     = var.rgname
  location = var.location
}


resource "azurerm_app_service" "example" {
  count = 2
  name                = "apsvc-ads-dev-00${count.index}"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  app_service_plan_id = var.serviceplanid
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