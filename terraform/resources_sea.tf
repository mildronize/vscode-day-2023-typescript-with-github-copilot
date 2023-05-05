module "naming_convention_sea" {
  source     = "./modules/naming_convention"
  for_each   = tomap(local.resource_attributes_group.sea.resource_attributes)
  attributes = merge(local.resource_attributes_group.sea.shared_resource_attributes, each.value)
}

resource "azurerm_resource_group" "sea" {
  name     = module.naming_convention_sea["resource_group"].name
  location = "Southeast Asia"
}

resource "azurerm_service_plan" "sea" {
  name                = module.naming_convention_sea["app_service_plan"].name
  resource_group_name = azurerm_resource_group.sea.name
  location            = azurerm_resource_group.sea.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "sea_web" {
  name                = module.naming_convention_sea["web"].name
  resource_group_name = azurerm_resource_group.sea.name
  location            = azurerm_service_plan.sea.location
  service_plan_id     = azurerm_service_plan.sea.id
  https_only          = true

  site_config {
    always_on = false
  }
}

resource "azurerm_linux_web_app" "sea_api" {
  name                = module.naming_convention_sea["api"].name
  resource_group_name = azurerm_resource_group.sea.name
  location            = azurerm_service_plan.sea.location
  service_plan_id     = azurerm_service_plan.sea.id
  https_only          = true

  site_config {
    always_on = false
  }
}

resource "azurerm_linux_web_app" "sea_mobile_api" {
  name                = module.naming_convention_sea["mobile_api"].name
  resource_group_name = azurerm_resource_group.sea.name
  location            = azurerm_service_plan.sea.location
  service_plan_id     = azurerm_service_plan.sea.id
  https_only          = true

  site_config {
    always_on = false
  }
}
