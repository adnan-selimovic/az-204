#create a queue
az storage queue create --name mysampleqeueu29880 --account-name <ACCOUNT NAME>
#delete a queue
az storage queue delete --name mysampleqeueu29880
#view messages in a queue (without affecting visibility)
az storage message peek --queue-name mysampleqeueu29880 --account-name <ACCOUNT NAME>
#delete all messages in a queue
az storage message clear --queue-name mysampleqeueu29880

$ export AZURE_STORAGE_ACCOUNT=mysampleqeueu29880

az storage message get --queue-name mysampleqeueu29880

az storage message delete --id <guid> --pop-receipt <POP RECEIPT> --queue-name mysampleqeueu29880

# env za SDK
export AZURE_STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=csb100320023342203d;AccountKey=osBOmXCJLxrxTJeGnEhO697jCIrqE0lCzsXytSKCPLP/FW7X1RxM8/axhweRbLeeTTqm5uk1xILG+AStLGEKFQ==;EndpointSuffix=core.windows.net"