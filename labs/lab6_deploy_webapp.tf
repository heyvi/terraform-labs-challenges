provider "azurerm" {
    version = 1.38
    alias  = "west"
    region = "west us"
}

# provider "azurerm" {
#   alias  = "west"
#   region = "west us"
# }

resource "azurerm_app_service_plan" "svcplan" {
  name                = "newweb-appserviceplan"
  location            = "westus"
  resource_group_name = "1-ea811c3a-playground-sandbox"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = "custom-tf-webapp-for-thestudent"
  location            = "westus"
  resource_group_name = "1-ea811c3a-playground-sandbox"
  app_service_plan_id = azurerm_app_service_plan.svcplan.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}