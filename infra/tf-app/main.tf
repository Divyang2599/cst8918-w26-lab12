# infra/tf-app/main.tf

resource "azurerm_resource_group" "app" {
  name     = "lab12_group4-a12-rg"
  location = "Canada Central"
}