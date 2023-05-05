
locals {

  resource_attributes_group = {
    sea = {
      shared_resource_attributes = {
        org           = var.org
        project       = var.project
        project_short = var.project_short
        environment   = var.environment
        scope         = "sea"
        scope_short   = "sea"
      }
      resource_attributes = {
        resource_group   = { type = "resource_group", name = "" }
        app_service_plan = { type = "app_service_plan", name = "main" }
        web              = { type = "app_service", name = "web" }
        api              = { type = "app_service", name = "api" }
        mobile_api       = { type = "app_service", name = "mobile_api" }
      }
    }

    eastasia = {
      shared_resource_attributes = {
        org           = var.org
        project       = var.project
        project_short = var.project_short
        environment   = var.environment
        scope         = "eastasia"
        scope_short   = "eastasia"
      }
      resource_attributes = {
        resource_group   = { type = "resource_group", name = "" }
        app_service_plan = { type = "app_service_plan", name = "main" }
        web              = { type = "app_service", name = "web" }
        api              = { type = "app_service", name = "api" }
        mobile_api       = { type = "app_service", name = "mobile_api" }
      }
    }

    auseast = {
      shared_resource_attributes = {
        org           = var.org
        project       = var.project
        project_short = var.project_short
        environment   = var.environment
        scope         = "auseast"
        scope_short   = "auseast"
      }
      resource_attributes = {
        resource_group   = { type = "resource_group", name = "" }
        app_service_plan = { type = "app_service_plan", name = "main" }
        web              = { type = "app_service", name = "web" }
        api              = { type = "app_service", name = "api" }
        mobile_api       = { type = "app_service", name = "mobile_api" }
      }
    }
  }


}
