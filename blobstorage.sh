az storage account create
    --name storagepluralsight01
    --resource-group pluralsight
    --location westeurope
    --sku Standard_RAGRS
    --kind StorageV2

New-AzStorageAccount -Name storagepluralsight01
    -ResourceGroupName pluralsight
    -Location westeurope
    -SkuName Standard_RAGRS
    -Kind StorageV2
    
#Shared Key = AccountKey param u conn str
#Shared Access Signature blob SAS URL
#Anonymous na nivou kontejnera

az storage blob set-tier
    --account-key 1234567890
    --account-name storagepluralsight01
    --container-name images
    --name thomas.jpg
    --tier Cool

#Copy a Blob with the Azure CLI
az storage blob copy start
    --source-account-name storagepluralsight01
    --source-account-key 00000000
    --source-container images
    --source-blob thomas.jpg
    --account-name storagepluralsight02
    --account-key 00000000
    --destination-container pictures
    --destination-blob thomas.jpg

#moze i start-batch, ali bez source i dest bloba


#Upload a Local Folder
azcopy copy
    "C:\Documents" # prefixes blobs with "Documents""
    "C:\Documents\*" #Does NOT prefix blobs
"https://storagepluralsight01.blob.core.windows.net/[container]?[SAS]""
    --resursive=true