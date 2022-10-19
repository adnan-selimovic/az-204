az eventhubs namespace create --resource-group <GROUP NAME> --location \
    --name <NAMESPACE NAME> \
    --sku Standard or Basic

#Event Hubs Creation
az eventhubs eventhub create --name <EVENT HUB NAME> 
    --namespace <NAMESPACE NAME>
    --message-retention 3 # 1-7 days
    --partition-count 4 # buckets 2-32
    -g <GROUP NAME>

az eventhubs eventhub create --name wired-brain-eh --namespace wired-brain-eh-ns6680 --message-retention 1 --partition-count 4 -g wiredbrain-rg