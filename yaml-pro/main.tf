provider "azurerm" {
  features {
 }

}
resource "azurerm_resource_group" "main" {
  name     = var.rgname
  location = var.location
}

module "module1" {
 source = "./modules/appinsights"
}

module "module2" {
 source = "./modules/appseviceplan"
}

module "module3" {
 source = "./modules/appservices"
 serviceplanid = module.module2.appserviceplan-id
}
