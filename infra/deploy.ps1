$sid = "943e2738-85dc-40a6-b4a6-897746b21e8c"
$rg = "RG-ftos-cloud-chatbot-PROD"

az deployment sub create `
 --subscription $sid `
 --location 'westeurope' `
 --template-file .\infra\main.bicep

az ad sp create-for-rbac `
   --name 'sp-ftos-cloud-chatbot-prod' `
   --role contributor `
   --scopes /subscriptions/$sid/resourceGroups/$rg `
   --sdk-auth --output json

az ad sp credential reset `
   --id '34b35e38-8558-4a76-b687-c7044a25761a' `
   --years 2 `
   --output json
