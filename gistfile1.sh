#Create App Service via Azure CLI
az group create -n webapps-dev-rg -l eastus

az appservice plan create --name webapps-dev-plan --resource-group webapps-dev-rg --sku f1 --is-linux

az webapp list-runtimes --linux
az webapp create -g webapps-dev-rg -p webapps-dev-plan -n mp10230 --runtime "node|18-lts"

# Create variables
$webappname = "mywebapp$(Get-Random)"
$rgname = 'webapps3-dev-rg'
$location = 'eastus'

# Create a resource group
New-AzResourceGroup -Name $rgname -Location $location

# Create an App Service plan in S1 tier
New-AzAppServicePlan -Name $webappname -Location $location -ResourceGroupName $rgname -Tier S1

# Create a web app
New-AzWebApp -Name $webappname -Location $location -AppServicePlan $webappname -ResourceGroupName $rgname

#Creating a Web App with an ARM Template
New-AzResourceGroup -Name <resource-group-name> -Location <resource-group-location> #use this command when you need to create a new resource group for your deployment
New-AzResourceGroupDeployment -ResourceGroupName <resource-group-name> -TemplateUri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/application-workloads/ibm-cloud-pak/ibm-cloud-pak-for-data/azuredeploy.json

az group create --name <resource-group-name> --location <resource-group-location> #use this command when you need to create a new resource group for your deployment
az group deployment create --resource-group <my-resource-group> --template-uri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/application-workloads/ibm-cloud-pak/ibm-cloud-pak-for-data/azuredeploy.json