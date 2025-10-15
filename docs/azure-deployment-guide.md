# Azure Deployment Quick Reference

## Azure Static Web Apps

### Create Static Web App
```bash
# Via Azure CLI
az staticwebapp create \
    --name my-static-app \
    --resource-group my-rg \
    --source https://github.com/user/repo \
    --location "East US 2" \
    --branch main \
    --app-location "/" \
    --output-location "build"
```

### GitHub Actions Workflow
```yaml
name: Deploy Static Web App
on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: "/"
          output_location: "dist"
```

### Custom Domain
```bash
# Add custom domain
az staticwebapp hostname set \
    --name my-static-app \
    --resource-group my-rg \
    --hostname www.example.com

# DNS: Create CNAME record
# www -> my-static-app.azurestaticapps.net
```

## Azure Storage Account

### Create Storage Account
```bash
az storage account create \
    --name mystorageaccount \
    --resource-group my-rg \
    --location eastus \
    --sku Standard_LRS \
    --kind StorageV2
```

### Create Blob Container
```bash
az storage container create \
    --name uploads \
    --account-name mystorageaccount \
    --public-access off
```

### Generate SAS Token
```bash
az storage container generate-sas \
    --name uploads \
    --account-name mystorageaccount \
    --permissions rwdl \
    --expiry 2024-12-31 \
    --https-only
```

### Lifecycle Management
```json
{
  "rules": [{
    "name": "moveToArchive",
    "enabled": true,
    "type": "Lifecycle",
    "definition": {
      "filters": {
        "blobTypes": ["blockBlob"]
      },
      "actions": {
        "baseBlob": {
          "tierToCool": {"daysAfterModificationGreaterThan": 30},
          "tierToArchive": {"daysAfterModificationGreaterThan": 90}
        }
      }
    }
  }]
}
```

## Common Azure CLI Commands

```bash
# Login
az login

# Set subscription
az account set --subscription "My Subscription"

# List resources
az resource list --resource-group my-rg

# Create resource group
az group create --name my-rg --location eastus

# Delete resource group
az group delete --name my-rg --yes
```

## Cost Optimization Tips

1. **Use Free Tiers**: Static Web Apps free tier (100GB bandwidth)
2. **Storage Lifecycle**: Auto-move to cool/archive tiers
3. **Reserved Instances**: For long-running resources
4. **Auto-shutdown**: VMs during non-business hours
5. **Monitor Usage**: Azure Cost Management + Billing alerts
