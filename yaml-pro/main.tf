provider "azurerm" {
  features {
 }

}

module "module1" {
 source = "./modules/appinsights"
}

module "module2" {
 source = "./modules/appseviceplan"
}