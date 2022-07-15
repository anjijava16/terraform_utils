# Reference Link
https://tsuyoshiushio.medium.com/automatically-deploy-and-configure-eventhubs-stream-analytics-and-cosmosdb-using-terraform-16aa5a34240e

# Local Exec
Sometimes, you don’t want to avoid to use ARM, right? then You might use local exec provisioner. I wanted to create a database and collection after the creation. In this case, I use Azure CLI to create these and call it after the cosmod db account has been created. You can pass the parameter to it.

