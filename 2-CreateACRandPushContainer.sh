set ACR_NAME=psdemoacr%RANDOM%

az acr create --resource-group psdemo-rg --name %ACR_NAME% --sku Basic
az acr login --name %ACR_NAME%

ACR_LOGINSERVER=$(az acr show --name $ACR_NAME --query loginServer --output tsv)
#psdemoacr29492.azurecr.io
set ACR_LOGINSERVER=psdemoacr29492.azurecr.io

docker tag helloworldimage:v1 %ACR_LOGINSERVER%/helloworldimage:v1
docker push %ACR_LOGINSERVER%/helloworldimage:v1
#Build using ACR Tasks -- . ref local Dockerfile (isto kao docker tag i push)
az acr build --image "helloworldimage:v1-acr-task" --registry %ACR_NAME% .

#Get a list of the repositories and images/tags in our Azure Container Registry
az acr repository list --name %ACR_NAME%
az acr repository show-tags --name %ACR_NAME% --repository webppimage --output table


#
#Deploying Containers in ACI from Container Registries
#
ACR_REGISTRY_ID=$(az acr show --name $ACR_NAME --query id --output tsv)

set SP_NAME=http://%ACR_NAME%-pull #acr-service-principal
#--name je service principle name
set SP_PASSWD=$(az ad sp create-for-rbac) --name http://%ACR_NAME%-pull --scopes %ACR_REGISTRY_ID% --role acrpull --query password --output tsv)
set APPID=$(az ad sp show --id http://%ACR_NAME%-pull --query appId --output tsv) #User name za registraciju na ACR

#Running a Container from ACR in ACI
az container create --resource-group psdemo-rg --name psdemo-helloworld-cli --dns-name-label psdemo-helloworld-cli --ports 80 --image %ACR_LOGINSERVER%/helloworldimage:v1 --registry-login-server %ACR_LOGINSERVER% --registry-username %SP_APPID% --registry-password %SP_PASSWS%
#psdemo-helloworld-cli.eastus.azurecontainer.io
az container show --resource-group 'psdemo-rg' --name 'psdemo-helloworld-cli'

az container logs --resource-group psdemo-rg --name psdemo-helloworld-cli 

az container delete --resource-group psdemo-rg --name psdemo-helloworld-portal --yes
az group delete --resource-group psdemo-rg