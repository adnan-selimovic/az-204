# create a sql api cosmos db account
az cosmosdb create --name pluralsight$RANDOM --resource-group pluralsight


# create a sql database
az cosmosdb sql database create --account-name pluralsight6831 --name sampledb --resource-group adnan.selimovic76_rg_2740

# create a sql database container
# container = table
az cosmosdb sql container create --resource-group adnan.selimovic76_rg_2740 --account-name pluralsight6831 --database-name sampledb --name samplecontainer --partition-key-path "/employeeid"