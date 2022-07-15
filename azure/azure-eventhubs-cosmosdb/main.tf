# provider "azurerm" {
#   # Service Principle
#   subscription_id = "${var.subscription_id}"
#   client_id       = "${var.client_id}"
#   client_secret   = "${var.client_secret}"
#   tenant_id       = "${var.tenant_id}"
# }

# Create a resource group
resource "azurerm_resource_group" "test" {
  name     = var.resource_group
  location = var.location

  tags = {
    environtement = "${var.environment}"
  }
}

locals {
  servie_name="welcome"
}

locals {
  common_tags={


  }
}


# Event Hub

resource "azurerm_eventhub_namespace" "test" {
  
  name                = var.event_hub_namespace
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  sku                 = "Standard"
  capacity            = 1

  tags = {
    environment = var.environment
  }

  depends_on = ["azurerm_resource_group.test"]
}

resource "azurerm_eventhub" "test" {
  name                = var.event_hub_name
  namespace_name      = azurerm_eventhub_namespace.test.name
  resource_group_name = azurerm_resource_group.test.name
  partition_count     = 2
  message_retention   = 1

  depends_on = ["azurerm_eventhub_namespace.test"]
}

resource "azurerm_mysql_server" "db-server" {
  name                = "${var.project}-mysqlserver"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name

  administrator_login          = "welcome"
  administrator_login_password = "Maxs@123"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "database" {
  name                = "mydb"
  resource_group_name = azurerm_resource_group.test.name
  server_name         = azurerm_mysql_server.db-server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_databricks_workspace" "example" {
  name                = "databricks-test"
  resource_group_name = azurerm_resource_group.test.name
  location            = azurerm_resource_group.test.location
  sku                 = "standard"
  tags = {
    "Environment" = "Production"
  }
}
resource "azurerm_cosmosdb_account" "acc" {
  name = "welcomecomosdb"
  location = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  offer_type = "Standard"
  kind = "GlobalDocumentDB"

  enable_automatic_failover = true

  consistency_policy {
      consistency_level = "Session"
  }

  # geo_location {
  #     location = "${azurerm_resource_group.test.location}"
  #     failover_priority = 1
  # }

  geo_location {
      location = "${azurerm_resource_group.test.location}"
      failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "db" {
  name = "products"
  resource_group_name = "${azurerm_cosmosdb_account.acc.resource_group_name}"
  account_name = "${azurerm_cosmosdb_account.acc.name}"
}

resource "azurerm_cosmosdb_sql_container" "coll" {
  name = "Clothes"
  resource_group_name = "${azurerm_cosmosdb_account.acc.resource_group_name}"
  account_name = "${azurerm_cosmosdb_account.acc.name}"
  database_name = "${azurerm_cosmosdb_sql_database.db.name}"
  partition_key_path = "/ClothesId"
}


# data "azurerm_cosmosdb_account" "example" {
#   name                = "tfex-cosmosdb-account"
#   resource_group_name = azurerm_resource_group.test.name
# }

# resource "azurerm_cosmosdb_table" "example" {
#   name                = "tfex-cosmos-table"
#   resource_group_name = azurerm_resource_group.test.name
#   account_name        = "tfex-cosmosdb-account"
#   throughput          = 400
# }

# resource "azurerm_cosmosdb_account" "appdb" {
#   # name                = "${var.cosmosDBAccountName}"
#   # location            = "${var.location}"
#   # resource_group_name = "${var.resourceGroupName}"

#   name                = var.cosmosdb_account_name
#   location            = azurerm_resource_group.test.location
#   resource_group_name = azurerm_resource_group.test.name
#   offer_type          = "Standard"
#   kind                = "GlobalDocumentDB"

#   enable_automatic_failover = true

#   consistency_policy {
#     consistency_level       = "Session"
#   }

#   geo_location {
#     location          = azurerm_resource_group.test.location
#     failover_priority = 1
#   }

#   geo_location {
#     prefix            = var.cosmosdb_account_name
#     location          = azurerm_resource_group.test.location
#     failover_priority = 0
#   }
# }

# Cosmos DB

# resource "azurerm_cosmosdb_account" "cosmosdb_test" {
#   name                = var.cosmosdb_account_name
#   location            = azurerm_resource_group.test.location
#   resource_group_name = azurerm_resource_group.test.name
#   offer_type          = var.cosmosdb_offer_type

# consistency_policy {
#     consistency_level       = "BoundedStaleness"
#     max_interval_in_seconds = 10
#     max_staleness_prefix    = 200
#   }

#   geo_location {
#     location          = azurerm_resource_group.test.location
#     failover_priority = 1
#   }

#   geo_location {
#     location          = azurerm_resource_group.test.location
#     failover_priority = 0
#   }

#   # consistency_policy = {
#   #   consistency_level = var.cosmosdb_consistency_level
#   # }

#   # failover_policy = {
#   #   location = "${azurerm_resource_group.test.location}"
#   #   priority = 0
#   # }

#   # Create Cosmos DB and Collection. It requires az command
#   # https://docs.microsoft.com/ja-jp/azure/cosmos-db/scripts/create-database-account-collections-cli?toc=%2fcli%2fazure%2ftoc.json

#   provisioner "local-exec" {
#     command = "az cosmosdb database create --name ${var.cosmosdb_account_name} --db-name ${var.stream_analytics_cosmosdb_name} --resource-group ${azurerm_resource_group.test.name}"
#   }
  
#   provisioner "local-exec" {
#     command = "az cosmosdb collection create --collection-name ${var.stream_analytics_cosmosdb_collection_name_pattern} --name ${var.cosmosdb_account_name} --db-name ${var.stream_analytics_cosmosdb_name} --resource-group ${azurerm_resource_group.test.name} --partition-key-path ${var.stream_analytics_cosmosdb_partition_key}"
#   }

#   tags = {
#     environment = "${var.environment}"
#   }
#   depends_on = ["azurerm_resource_group.test"]
# }


# Stream Analytics

# resource "azurerm_template_deployment" "test" {
#   name                = "stream-deployment-01"
#   resource_group_name = "${azurerm_resource_group.test.name}"
#   template_body       = "${file("${path.cwd}/template/template.json")}"

#   parameters {
#     // Stream Analytics parameter
#     name       = "${var.stream_analytics_name}"
#     location   = "${azurerm_resource_group.test.location}"
#     apiVersion = "2016-03-01"
#     sku        = "${var.stream_analytics_sku}"
#     jobType    = "Cloud"

#     // streamingUnits = "1"
#     eventHubNameSpace              = "${azurerm_eventhub_namespace.test.name}"
#     eventHubSharedAccessPolicyName = "RootManageSharedAccessKey"                                // need investigate
#     eventHubSharedAccessKey        = "${azurerm_eventhub_namespace.test.default_primary_key}"
#     eventHubName                   = "${azurerm_eventhub.test.name}"
#     cosmosDBAccountName            = "${azurerm_cosmosdb_account.test.name}"
#     cosmosDBAccountKey             = "${azurerm_cosmosdb_account.test.primary_master_key}"
#     cosmosDBDatabaseName           = "${var.stream_analytics_cosmosdb_name}"
#     cosmosDBCollectionNamePattern  = "${var.stream_analytics_cosmosdb_collection_name_pattern}"
#     cosmosDBPartitionKey           = "${var.stream_analytics_cosmosdb_partition_key}"
#   }

#   deployment_mode = "Incremental"
#   depends_on      = ["azurerm_resource_group.test", "azurerm_cosmosdb_account.test", "azurerm_eventhub.test"]
# }
