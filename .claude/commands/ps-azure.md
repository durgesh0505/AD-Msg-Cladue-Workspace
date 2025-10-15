Generate Azure PowerShell script using latest Az modules from Context7.

## Usage

```bash
/ps-azure "[description of Azure operation]"
```

## Behavior

Generates Azure PowerShell scripts with:

1. **Fetch Latest Az Modules**: Use Context7 for current Az.* modules
2. **Generate Authentication**: Include Connect-AzAccount with proper context
3. **Generate Script**: Complete Azure operation with error handling
4. **Include Best Practices**: Tagging, naming conventions, cost awareness
5. **Document Permissions**: Required Azure RBAC roles

## Azure Coverage

- **Compute**: VMs, VM Scale Sets, availability sets, disks
- **Storage**: Storage accounts, blob containers, file shares, queues
- **Networking**: VNets, subnets, NSGs, load balancers, App Gateway
- **Web Apps**: App Services, Static Web Apps, Function Apps
- **Databases**: SQL Database, Cosmos DB, MySQL, PostgreSQL
- **Identity**: Managed identities, role assignments, policies
- **Monitoring**: Log Analytics, Application Insights, alerts
- **Cost Management**: Resource tagging, cost analysis, budgets

## Examples

### Example 1: VM Status Report

**Command**:
```bash
/ps-azure "Generate report of all VMs showing name, status, size, resource group, tags, and estimated monthly cost. Export to CSV."
```

**Generated**: `scripts/Azure/Azure-VM-Status-Report.ps1`

**Features**:
```powershell
# Connect to Azure
Connect-AzAccount

# Get all subscriptions
$subscriptions = Get-AzSubscription

$report = foreach ($sub in $subscriptions) {
    Set-AzContext -SubscriptionId $sub.Id

    # Get all VMs
    $vms = Get-AzVM -Status

    foreach ($vm in $vms) {
        # Get VM size pricing (approximate)
        $vmSize = Get-AzVMSize -Location $vm.Location | Where-Object {$_.Name -eq $vm.HardwareProfile.VmSize}

        [PSCustomObject]@{
            Subscription = $sub.Name
            VMName = $vm.Name
            ResourceGroup = $vm.ResourceGroupName
            Location = $vm.Location
            Status = ($vm.Statuses | Where-Object {$_.Code -like "PowerState/*"}).DisplayStatus
            Size = $vm.HardwareProfile.VmSize
            OS = $vm.StorageProfile.OsDisk.OsType
            Tags = ($vm.Tags.GetEnumerator() | ForEach-Object {"$($_.Key)=$($_.Value)"}) -join "; "
        }
    }
}

$report | Export-Csv -Path "Azure-VM-Report.csv" -NoTypeInformation
```

---

### Example 2: Create Storage Account with Containers

**Command**:
```bash
/ps-azure "Create storage account in specified resource group with 3 blob containers: uploads, processed, archive. Configure lifecycle management to move to cool tier after 30 days."
```

**Generated**: `scripts/Azure/Create-Storage-Account-With-Containers.ps1`

**Features**:
```powershell
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroupName,

    [Parameter(Mandatory=$true)]
    [string]$StorageAccountName,

    [Parameter(Mandatory=$true)]
    [string]$Location
)

# Connect to Azure
Connect-AzAccount

# Create storage account
$storageAccount = New-AzStorageAccount `
    -ResourceGroupName $ResourceGroupName `
    -Name $StorageAccountName `
    -Location $Location `
    -SkuName Standard_LRS `
    -Kind StorageV2 `
    -Tag @{Project="DataProcessing"; Environment="Production"}

Write-Verbose "Storage account created: $StorageAccountName"

# Get storage context
$ctx = $storageAccount.Context

# Create containers
$containers = @("uploads", "processed", "archive")
foreach ($container in $containers) {
    New-AzStorageContainer -Name $container -Context $ctx -Permission Off
    Write-Verbose "Container created: $container"
}

# Configure lifecycle management
$rule = New-AzStorageAccountManagementPolicyRule `
    -Name "MoveToArchive" `
    -Action @{
        BaseBlobAction = @{
            TierToCool = @{DaysAfterModificationGreaterThan = 30}
            TierToArchive = @{DaysAfterModificationGreaterThan = 90}
        }
    } `
    -Filter @{BlobTypes = @("blockBlob")}

Set-AzStorageAccountManagementPolicy `
    -ResourceGroupName $ResourceGroupName `
    -AccountName $StorageAccountName `
    -Rule $rule

Write-Verbose "Lifecycle policy configured"
```

---

### Example 3: Deploy Web App with Custom Domain

**Command**:
```bash
/ps-azure "Create App Service Plan and Web App. Deploy from GitHub repo. Configure custom domain and SSL certificate."
```

**Generated**: `scripts/Azure/Deploy-WebApp-With-Custom-Domain.ps1`

**Features**:
- App Service Plan creation (tier selection)
- Web App creation with runtime stack
- GitHub repository configuration
- Custom domain mapping
- Managed certificate binding
- Application Insights integration

---

### Example 4: Resource Tagging Enforcement

**Command**:
```bash
/ps-azure "Scan all resources in subscription. Tag untagged resources with: Environment=Unclassified, Owner=Unknown, CostCenter=Unassigned. Generate report of resources that were tagged."
```

**Generated**: `scripts/Azure/Enforce-Resource-Tagging.ps1`

**Features**:
```powershell
# Get all resources without required tags
$allResources = Get-AzResource

$requiredTags = @("Environment", "Owner", "CostCenter")
$taggedResources = @()

foreach ($resource in $allResources) {
    $needsTagging = $false
    $newTags = $resource.Tags ?? @{}

    foreach ($tag in $requiredTags) {
        if (-not $resource.Tags.ContainsKey($tag)) {
            $needsTagging = $true
            $newTags[$tag] = switch ($tag) {
                "Environment" { "Unclassified" }
                "Owner" { "Unknown" }
                "CostCenter" { "Unassigned" }
            }
        }
    }

    if ($needsTagging) {
        Set-AzResource -ResourceId $resource.ResourceId -Tag $newTags -Force
        $taggedResources += [PSCustomObject]@{
            ResourceName = $resource.Name
            ResourceType = $resource.ResourceType
            ResourceGroup = $resource.ResourceGroupName
            TagsAdded = ($newTags.GetEnumerator() | Where-Object {$resource.Tags -notcontains $_.Key} | ForEach-Object {"$($_.Key)=$($_.Value)"}) -join "; "
        }
    }
}

$taggedResources | Export-Csv -Path "Resource-Tagging-Report.csv" -NoTypeInformation
```

---

### Example 5: Cost Analysis by Tag

**Command**:
```bash
/ps-azure "Generate cost report grouped by CostCenter tag for last 30 days. Show total cost per cost center and top 5 resources by cost."
```

**Generated**: `scripts/Azure/Cost-Analysis-By-Tag.ps1`

**Features**:
- Get-AzConsumptionUsageDetail for usage data
- Group by tags
- Calculate costs by cost center
- Identify top expensive resources
- Export to Excel or CSV with formatting

---

## Authentication Methods

### Interactive Login
```powershell
Connect-AzAccount
```

### Service Principal (Certificate)
```powershell
$TenantId = "tenant-id"
$AppId = "app-id"
$Thumbprint = "cert-thumbprint"

Connect-AzAccount -ServicePrincipal `
    -TenantId $TenantId `
    -ApplicationId $AppId `
    -CertificateThumbprint $Thumbprint
```

### Managed Identity (Azure Automation/VM)
```powershell
Connect-AzAccount -Identity
```

---

## Common Resource Operations

### Resource Groups
```powershell
# Create
New-AzResourceGroup -Name "rg-production" -Location "eastus" -Tag @{Environment="Production"}

# List
Get-AzResourceGroup

# Delete
Remove-AzResourceGroup -Name "rg-test" -Force
```

### Resource Tagging
```powershell
# Tag resource
$resource = Get-AzResource -ResourceName "vm-web-01"
Set-AzResource -ResourceId $resource.ResourceId -Tag @{Environment="Production"; Owner="John"} -Force

# Tag resource group
Set-AzResourceGroup -Name "rg-production" -Tag @{Project="WebApp"; CostCenter="IT"}
```

### Resource Queries
```powershell
# Find by tag
Get-AzResource -TagName "Environment" -TagValue "Production"

# Find by type
Get-AzResource -ResourceType "Microsoft.Compute/virtualMachines"

# Find by resource group
Get-AzResource -ResourceGroupName "rg-production"
```

---

## Naming Conventions

Generated scripts follow Azure naming best practices:

```
Resource Type         | Pattern                    | Example
---------------------|----------------------------|------------------
Resource Group        | rg-{app}-{env}             | rg-webapp-prod
Virtual Machine       | vm-{app}-{instance}        | vm-web-01
Storage Account       | st{app}{env}{random}       | stwebappprod1234
App Service           | app-{app}-{env}            | app-webapp-prod
Function App          | func-{app}-{env}           | func-processor-prod
SQL Database          | sql-{app}-{env}            | sql-webapp-prod
Key Vault             | kv-{app}-{env}             | kv-webapp-prod
```

---

## Cost Optimization Patterns

### Automatic Shutdown/Startup
```powershell
# Schedule VM shutdown (cost savings)
$vm = Get-AzVM -ResourceGroupName "rg-dev" -Name "vm-dev-01"
$vm | Set-AzVMAutoShutdownConfig -Enable `
    -Time "19:00" `
    -TimeZone "Eastern Standard Time" `
    -NotificationEmail "admin@contoso.com"
```

### Reserved Instances Check
```powershell
# Identify VMs that could use reserved instances
$vms = Get-AzVM
$longRunningVMs = $vms | Where-Object {
    $vm = Get-AzVM -ResourceGroupName $_.ResourceGroupName -Name $_.Name -Status
    $runTime = ($vm.Statuses | Where-Object {$_.Code -eq "PowerState/running"}).Time
    $runTime -gt (Get-Date).AddDays(-30)  # Running continuously for 30+ days
}
```

### Right-Sizing Analysis
```powershell
# Get VM metrics to identify undersized/oversized VMs
$metrics = Get-AzMetric -ResourceId $vm.Id `
    -MetricName "Percentage CPU" `
    -StartTime (Get-Date).AddDays(-30) `
    -TimeGrain 01:00:00

$avgCPU = ($metrics.Data.Average | Measure-Object -Average).Average
if ($avgCPU -lt 20) {
    Write-Warning "$($vm.Name) average CPU is $avgCPU% - consider downsizing"
}
```

---

## Error Handling

### Resource Already Exists
```powershell
try {
    New-AzStorageAccount -ResourceGroupName "rg-prod" -Name "mystorageaccount" -Location "eastus" -SkuName Standard_LRS
}
catch {
    if ($_.Exception.Message -like "*already exists*") {
        Write-Warning "Storage account already exists, using existing account"
        $storageAccount = Get-AzStorageAccount -ResourceGroupName "rg-prod" -Name "mystorageaccount"
    }
    else {
        throw
    }
}
```

### Insufficient Permissions
```powershell
try {
    New-AzResourceGroup -Name "rg-test" -Location "eastus"
}
catch {
    if ($_.Exception.Message -like "*Authorization failed*") {
        Write-Error "Insufficient permissions. Required role: Contributor or Owner"
    }
    throw
}
```

---

## Integration

- **Context7 MCP**: Fetches latest Az.* module documentation
- **Azure Deployer Agent**: Automatically activated for deployment scripts
- **Sequential Thinking**: Used for complex architecture decisions

---

## Best Practices

- ✅ Use latest Az modules (via Context7)
- ✅ Tag all resources (Environment, Owner, CostCenter)
- ✅ Follow naming conventions
- ✅ Use managed identities for automation
- ✅ Implement cost controls
- ✅ Enable monitoring and alerting
- ✅ Document required permissions
- ✅ Use resource locks for critical resources

---

## Required RBAC Roles

| Operation | Minimum Role |
|-----------|-------------|
| Read resources | Reader |
| Create/modify resources | Contributor |
| Manage RBAC | Owner or User Access Administrator |
| Cost management | Cost Management Reader |

---

## Related Commands

- `/webapp-deploy` - Specialized for Azure Static Web Apps deployment
- `/storage-setup` - Storage account configuration wizard
- `@azure-deployer` - Azure deployment specialist agent

---

## Tips

1. **Test in Dev First**: Always test scripts in development subscription
2. **Use Resource Locks**: Protect production resources from accidental deletion
3. **Monitor Costs**: Review Azure Cost Management regularly
4. **Automate Tagging**: Enforce tagging policies for better cost tracking
5. **Document Permissions**: Always specify required RBAC roles in script comments
