# # Service Principle
# variable "subscription_id" {}

# variable "client_id" {}

# variable "client_secret" {}

# variable "tenant_id" {}

# Resource Group

variable "project"{
    type = string
    description = "Project name."
    default = "welcomdemo"
}


variable "resource_group" {}

variable "location" {}

variable "environment" {}

# EventHub

variable "event_hub_namespace" {}

variable "event_hub_name" {}

# Stream Analytics

# variable "stream_analytics_name" {}

# variable "stream_analytics_sku" {}

variable "stream_analytics_cosmosdb_name" {}

variable "stream_analytics_cosmosdb_collection_name_pattern" {}

variable "stream_analytics_cosmosdb_partition_key" {}

# CosmosDB 

variable "cosmosdb_account_name" {}

variable "cosmosdb_consistency_level" {}

variable "cosmosdb_offer_type" {}