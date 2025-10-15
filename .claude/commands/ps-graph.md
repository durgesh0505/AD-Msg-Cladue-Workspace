Generate Microsoft Graph PowerShell script using latest SDK documentation.

## Usage

```bash
/ps-graph "[description of Microsoft Graph operation]"
```

## Behavior

Generates Microsoft Graph PowerShell scripts with:

1. **Fetch Latest Graph SDK**: Use Context7 for current Microsoft.Graph modules
2. **Identify Required Scopes**: Determine API permissions needed
3. **Generate Authentication**: Include proper Connect-MgGraph with scopes
4. **Generate Script**: Create complete Graph operation with error handling
5. **Document Permissions**: List required API permissions (delegated/application)

## Microsoft Graph Coverage

- **Users**: Get, create, update, delete users, manage properties
- **Groups**: M365 Groups, Security Groups, distribution lists, membership
- **Teams**: Team creation, channels, members, settings
- **SharePoint**: Sites, lists, document libraries, permissions
- **Mail**: Read, send, manage mail, folders, rules
- **Calendar**: Events, availability, scheduling
- **OneDrive**: Files, folders, sharing
- **Applications**: App registrations, service principals
- **Licenses**: Assignment, availability, SKUs
- **Compliance**: Retention policies, DLP, eDiscovery

## Examples

### Example 1: Export M365 Groups and Owners

**Command**:
```bash
/ps-graph "Get all Microsoft 365 groups with their owners and member count. Export to CSV."
```

**Generated**: `scripts/Graph/Export-M365-Groups-And-Owners.ps1`

**Features**:
```powershell
# Authentication with minimal scopes
Connect-MgGraph -Scopes "Group.Read.All", "User.Read.All"

# Get all M365 groups
$groups = Get-MgGroup -Filter "groupTypes/any(c:c eq 'Unified')" -All

# Get owners for each group
$results = foreach ($group in $groups) {
    $owners = Get-MgGroupOwner -GroupId $group.Id
    $members = Get-MgGroupMember -GroupId $group.Id -All

    [PSCustomObject]@{
        GroupName = $group.DisplayName
        GroupEmail = $group.Mail
        Owners = ($owners.AdditionalProperties.userPrincipalName -join "; ")
        MemberCount = $members.Count
        CreatedDate = $group.CreatedDateTime
    }
}

# Export to CSV
$results | Export-Csv -Path "M365-Groups-Report.csv" -NoTypeInformation
```

**Required Permissions**:
- Group.Read.All (delegated or application)
- User.Read.All (to resolve owner names)

---

### Example 2: Add Users to Teams

**Command**:
```bash
/ps-graph "Add users from CSV to specified Teams team as members. CSV has columns: UserEmail, TeamName."
```

**Generated**: `scripts/Graph/Add-Users-To-Teams.ps1`

**Features**:
- CSV validation
- Team lookup by name
- User lookup by UPN
- Add-MgTeamMember with error handling
- Success/failure logging

---

### Example 3: License Assignment Report

**Command**:
```bash
/ps-graph "Generate report showing all users with their assigned licenses. Include license name and assignment date."
```

**Generated**: `scripts/Graph/License-Assignment-Report.ps1`

**Features**:
```powershell
Connect-MgGraph -Scopes "User.Read.All", "Organization.Read.All"

# Get all licensed users
$users = Get-MgUser -Filter "assignedLicenses/`$count ne 0" -ConsistentcyLevel eventual -CountVariable licensedUsersCount -All

# Get license SKUs for name mapping
$skus = Get-MgSubscribedSku

# Create report
$report = foreach ($user in $users) {
    foreach ($license in $user.AssignedLicenses) {
        $skuName = ($skus | Where-Object {$_.SkuId -eq $license.SkuId}).SkuPartNumber

        [PSCustomObject]@{
            UserPrincipalName = $user.UserPrincipalName
            DisplayName = $user.DisplayName
            LicenseName = $skuName
            AssignedDate = $license.AssignedDateTime
        }
    }
}

$report | Export-Csv -Path "License-Assignments.csv" -NoTypeInformation
```

---

### Example 4: Bulk Create SharePoint Sites

**Command**:
```bash
/ps-graph "Create SharePoint communication sites from CSV. Columns: SiteTitle, SiteAlias, Description, Owner. Set sharing to 'Organization only'."
```

**Generated**: `scripts/Graph/Bulk-Create-SharePoint-Sites.ps1`

**Features**:
- CSV import and validation
- New-MgSite with communication site template
- Owner assignment
- Sharing settings configuration
- Progress reporting
- Error handling and logging

---

### Example 5: Inactive Users Report

**Command**:
```bash
/ps-graph "Find users who haven't signed in for 90+ days. Include last sign-in date, account status, license info."
```

**Generated**: `scripts/Graph/Inactive-Users-Report.ps1`

**Features**:
```powershell
Connect-MgGraph -Scopes "User.Read.All", "AuditLog.Read.All"

# Get users with sign-in activity
$users = Get-MgUser -All -Property DisplayName, UserPrincipalName, AccountEnabled, AssignedLicenses, SignInActivity

# Filter inactive users (90+ days)
$inactiveDate = (Get-Date).AddDays(-90)
$inactiveUsers = $users | Where-Object {
    $_.SignInActivity.LastSignInDateTime -lt $inactiveDate -or
    $null -eq $_.SignInActivity.LastSignInDateTime
}

# Generate report
$report = $inactiveUsers | Select-Object `
    DisplayName,
    UserPrincipalName,
    AccountEnabled,
    @{N='LastSignIn'; E={$_.SignInActivity.LastSignInDateTime}},
    @{N='DaysSinceSignIn'; E={
        if ($_.SignInActivity.LastSignInDateTime) {
            ((Get-Date) - $_.SignInActivity.LastSignInDateTime).Days
        } else {
            "Never"
        }
    }},
    @{N='LicenseCount'; E={$_.AssignedLicenses.Count}}

$report | Export-Csv -Path "Inactive-Users-Report.csv" -NoTypeInformation
```

---

## Authentication Methods

### Interactive (User Sign-In)
```powershell
Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All"
```

### Application (Certificate-Based)
```powershell
Connect-MgGraph -ClientId "app-id" `
    -TenantId "tenant-id" `
    -CertificateThumbprint "thumbprint"
```

### Application (Client Secret)
```powershell
$clientSecret = ConvertTo-SecureString "secret" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential("app-id", $clientSecret)
Connect-MgGraph -TenantId "tenant-id" -ClientSecretCredential $credential
```

---

## Common Scopes by Operation

| Operation | Required Scopes |
|-----------|----------------|
| Read users | User.Read.All |
| Create users | User.ReadWrite.All |
| Read groups | Group.Read.All |
| Manage groups | Group.ReadWrite.All |
| Read Teams | Team.ReadBasic.All |
| Manage Teams | TeamSettings.ReadWrite.All |
| Read mail | Mail.Read |
| Send mail | Mail.Send |
| Read files | Files.Read.All |
| Manage licenses | Organization.ReadWrite.All |
| Read audit logs | AuditLog.Read.All |

---

## Error Handling Patterns

### Throttling (429 Errors)
```powershell
try {
    Get-MgUser -All
}
catch {
    if ($_.Exception.Response.StatusCode -eq 429) {
        $retryAfter = $_.Exception.Response.Headers.RetryAfter
        Write-Warning "Throttled. Waiting $retryAfter seconds..."
        Start-Sleep -Seconds $retryAfter
        # Retry operation
    }
}
```

### Permission Errors
```powershell
try {
    Get-MgUser -UserId "user@domain.com"
}
catch {
    if ($_.Exception.Message -like "*Insufficient privileges*") {
        Write-Error "Missing required API permissions. Required: User.Read.All"
    }
    throw
}
```

---

## Batch Operations

For efficiency with multiple items:
```powershell
# Instead of individual calls:
foreach ($user in $users) {
    Get-MgUserMember -UserId $user.Id  # Many API calls
}

# Use batch requests:
$batchRequests = $users | ForEach-Object {
    @{
        id = $_.Id
        method = "GET"
        url = "/users/$($_.Id)/memberOf"
    }
}
Invoke-MgGraphRequest -Method POST -Uri "/$batch" -Body @{requests=$batchRequests}
```

---

## Pagination

Handle large result sets:
```powershell
# Automatic with -All
$allUsers = Get-MgUser -All

# Manual pagination
$uri = "https://graph.microsoft.com/v1.0/users?`$top=100"
$allResults = @()
do {
    $response = Invoke-MgGraphRequest -Uri $uri -Method GET
    $allResults += $response.value
    $uri = $response.'@odata.nextLink'
} while ($uri)
```

---

## Integration

- **Context7 MCP**: Fetches latest Microsoft.Graph SDK modules
- **Microsoft Graph Expert Agent**: Automatically activated for complex operations
- **Permission Documentation**: Always includes required scopes

---

## Best Practices

- ✅ Use latest Microsoft.Graph SDK (via Context7)
- ✅ Request minimal scopes needed
- ✅ Handle throttling (429 errors)
- ✅ Use pagination for large datasets
- ✅ Batch operations when possible
- ✅ Disconnect when done (`Disconnect-MgGraph`)
- ✅ Document required permissions
- ✅ Use certificate auth for automation

---

## Related Commands

- `/ps-script` - General PowerShell script
- `/m365-admin` - M365 admin operations (may use Graph internally)
- `@microsoft-graph-expert` - Graph API specialist agent

---

## Tips

1. **Check Required Scopes**: Always document API permissions needed
2. **Test with Interactive Auth First**: Easier for testing before automation
3. **Use Specific Modules**: Import only needed modules (e.g., Microsoft.Graph.Users)
4. **Handle Pagination**: Use `-All` parameter for complete results
5. **Monitor Rate Limits**: Implement retry logic for throttling
