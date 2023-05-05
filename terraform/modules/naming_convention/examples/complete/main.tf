# Azure Provider configuration
provider "azurerm" {
  features {}
}

locals {
  common_resource_attributes = {
    org         = "wrm"
    project     = "storm"
    environment = "prod"
    scope_short = "ng"
    scope       = "utility_ng"
  }
  resource_names = {
    utility_ng_api = {
      name = "api"
      type = "app_service"

    }
    utility_ng = {
      name = ""
      type = "storage_account"
    }
  }

}

module "name_utility_ng_resource_group" {
  source = "../../"
  attributes = {
    name        = ""
    type        = "resource_group"
    org         = "wrm"
    project     = "storm"
    environment = "prod"
    scope       = "utility_ng"
    scope_short = "ng"
  }
}

module "name_utility_ng_app_service" {
  source   = "../../"
  for_each = toset(["", "api", "api_staging"])
  attributes = {
    name        = each.key
    type        = "app_service"
    org         = "wrm"
    project     = "storm"
    environment = "prod"
    scope       = "utility_ng"
    scope_short = "ng"
  }
}


module "naming_convention" {
  source     = "../../"
  for_each   = tomap(local.resource_names)
  attributes = merge(local.common_resource_attributes, each.value)
}


output "output" {
  # value = module.naming_convention["utility_ng"].name
  value = module.naming_convention
}
