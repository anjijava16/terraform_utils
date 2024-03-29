# Service Principle
# subscription_id     = "YOUR_SUBSCRIPTION_ID"
# client_id           = "YOUR_CLIENT_ID"
# client_secret       = "YOUR_CLIENT_SECRET"
# tenant_id           = "YOUR_TENANT_ID"

# Resource Group
project = "welcomdemo"
resource_group      = "welcomdemodataengneer"
location            = "East US"
environment         = "dev"


# Event Hub
event_hub_namespace = "ArtHub"
event_hub_name      = "target"

# Stream Analytics

# stream_analytics_name = "SomeJob"
# stream_analytics_sku = "standard"

stream_analytics_cosmosdb_name = "somedb"
stream_analytics_cosmosdb_collection_name_pattern = "collection"
stream_analytics_cosmosdb_partition_key = "/code"

# CosmosDB

cosmosdb_account_name = "sacosmos"
cosmosdb_consistency_level = "BoundedStaleness"
cosmosdb_offer_type = "Standard"