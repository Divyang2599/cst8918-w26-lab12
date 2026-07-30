# infra/tf-app/terraform.tf

terraform {
  required_version = "~> 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.96.0"
    }
  }
  # Remote backend: state lives in the storage account from Part A
  backend "azurerm" {
    storage_account_name = "lab12group4githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    # use_oidc = true  <-- we add this in Phase 4
  }
}

provider "azurerm" {
  features {}
}