# configure web app to run on Docker
az webapp config container set --docker-custom-image-name $dockerHubContainerPath --name $appName --resource-group skillcertlabs-rg