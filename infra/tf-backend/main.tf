# infra/tf-backend/main.tf

terraform {
  required_version = "~> 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.96.0"
    }
  }
  # No backend block here on purpose: this config's own state stays LOCAL.
}

provider "azurerm" {
  features {}
}

# Resource group that holds the state-storage account
resource "azurerm_resource_group" "backend" {
  name     = "lab12_group4-githubactions-rg"
  location = "Canada Central"
}

# Storage account for the remote Terraform state
resource "azurerm_storage_account" "backend" {
  name                     = "lab12group4githubactions" # 24 chars, lowercase+digits only
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2" # lab requirement
}

# Private container for the state file
resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private" # lab requirement — never public
}

# Outputs feed the next config and the GitHub secrets (Phase 4)
output "resource_group_name" {
  value = azurerm_resource_group.backend.name
}
output "storage_account_name" {
  value = azurerm_storage_account.backend.name
}
output "container_name" {
  value = azurerm_storage_container.tfstate.name
}
output "arm_access_key" {
  value     = azurerm_storage_account.backend.primary_access_key
  sensitive = true # never printed unless you explicitly ask with -raw
}