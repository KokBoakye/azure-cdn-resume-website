terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0" # pick a stable major version (e.g. 3.x)
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "bce6692a-736c-4805-bc40-f6af47e5c9c6"
}
