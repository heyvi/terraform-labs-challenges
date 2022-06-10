# provider "azurerm" {
#     features {}
#     skip_provider_registration = "true"
#     version = 3.9
#         }

provider "azurerm" {
    version = 1.38
    alias  = "west-us"
    region = "west us"
}

resource "azurerm_mysql_server" "example" {
  name                = "tflab-mysqlserver-1-happyperiod"
  location            = "West US"
  resource_group_name = "1-ea811c3a-playground-sandbox"

  sku {
    name     = "B_Gen5_2"
    capacity = 2
    tier     = "Basic"
    family   = "Gen5"
  }

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  administrator_login          = "mysqladminun"
  administrator_login_password = "easytologin4once!"
  version                      = "5.7"
  ssl_enforcement              = "Enabled"
}

resource "azurerm_mysql_database" "example" {
  name                = "examplemysqldb"
  resource_group_name = "1-ea811c3a-playground-sandbox"
  server_name         = azurerm_mysql_server.example.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}