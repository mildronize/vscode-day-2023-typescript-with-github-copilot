module "naming_convention_auseast" {
  source     = "./modules/naming_convention"
  for_each   = tomap(local.resource_attributes_group.auseast.resource_attributes)
  attributes = merge(local.resource_attributes_group.auseast.shared_resource_attributes, each.value)
}

resource "azurerm_resource_group" "auseast" {
  name     = module.naming_convention_auseast["resource_group"].name
  location = "Australia East"
}

resource "azurerm_service_plan" "auseast" {
  name                = module.naming_convention_auseast["app_service_plan"].name
  resource_group_name = azurerm_resource_group.auseast.name
  location            = azurerm_resource_group.auseast.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "auseast_web" {
  name                = module.naming_convention_auseast["web"].name
  resource_group_name = azurerm_resource_group.auseast.name
  location            = azurerm_service_plan.auseast.location
  service_plan_id     = azurerm_service_plan.auseast.id
  https_only          = true

  site_config {
    always_on = false
  }
}

resource "azurerm_linux_web_app" "auseast_api" {
  name                = module.naming_convention_auseast["api"].name
  resource_group_name = azurerm_resource_group.auseast.name
  location            = azurerm_service_plan.auseast.location
  service_plan_id     = azurerm_service_plan.auseast.id
  https_only          = true

  site_config {
    always_on = false
  }
}

resource "azurerm_linux_web_app" "auseast_mobile_api" {
  name                = module.naming_convention_auseast["mobile_api"].name
  resource_group_name = azurerm_resource_group.auseast.name
  location            = azurerm_service_plan.auseast.location
  service_plan_id     = azurerm_service_plan.auseast.id
  https_only          = true

  site_config {
    always_on = false
  }
}
