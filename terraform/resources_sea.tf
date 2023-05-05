module "naming_convention_common" {
  source     = "./modules/naming_convention"
  for_each   = tomap(local.resource_attributes_group.sea.resource_attributes)
  attributes = merge(local.resource_attributes_group.sea.shared_resource_attributes, each.value)
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East Asia"
}

resource "azurerm_service_plan" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "example" {
  name                = "thadaw-demo-101"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id
  https_only          = true

  site_config {
    always_on = false
  }
}