module "naming_convention_eastasia" {
  source     = "./modules/naming_convention"
  for_each   = tomap(local.resource_attributes_group.eastasia.resource_attributes)
  attributes = merge(local.resource_attributes_group.eastasia.shared_resource_attributes, each.value)
}

resource "azurerm_resource_group" "eastasia" {
  name     = module.naming_convention_eastasia["resource_group"].name
  location = "East Asia"
}

resource "azurerm_service_plan" "eastasia" {
  name                = module.naming_convention_eastasia["app_service_plan"].name
  resource_group_name = azurerm_resource_group.eastasia.name
  location            = azurerm_resource_group.eastasia.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "eastasia_web" {
  name                = module.naming_convention_eastasia["web"].name
  resource_group_name = azurerm_resource_group.eastasia.name
  location            = azurerm_service_plan.eastasia.location
  service_plan_id     = azurerm_service_plan.eastasia.id
  https_only          = true

  site_config {
    always_on = false
  }
}

resource "azurerm_linux_web_app" "eastasia_api" {
  name                = module.naming_convention_eastasia["api"].name
  resource_group_name = azurerm_resource_group.eastasia.name
  location            = azurerm_service_plan.eastasia.location
  service_plan_id     = azurerm_service_plan.eastasia.id
  https_only          = true

  site_config {
    always_on = false
  }
}

resource "azurerm_linux_web_app" "eastasia_mobile_api" {
  name                = module.naming_convention_eastasia["mobile_api"].name
  resource_group_name = azurerm_resource_group.eastasia.name
  location            = azurerm_service_plan.eastasia.location
  service_plan_id     = azurerm_service_plan.eastasia.id
  https_only          = true

  site_config {
    always_on = false
  }
}
