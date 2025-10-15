# Microsoft Graph Quick Reference

## Authentication

```powershell
# Interactive (delegated permissions)
Connect-MgGraph -Scopes "User.Read.All", "Group.Read.All"

# App-only (application permissions)
Connect-MgGraph -ClientId "app-id" `
    -TenantId "tenant-id" `
    -CertificateThumbprint "cert-thumbprint"

# Disconnect
Disconnect-MgGraph
```

## Common Operations

### Users
```powershell
# Get all users
Get-MgUser -All

# Get specific user
Get-MgUser -UserId "user@domain.com"

# Create user
New-MgUser -DisplayName "John Doe" `
    -UserPrincipalName "john.doe@domain.com" `
    -MailNickname "johndoe" `
    -AccountEnabled $true `
    -PasswordProfile @{
        Password = "TempPassword123!"
        ForceChangePasswordNextSignIn = $true
    }

# Update user
Update-MgUser -UserId "user@domain.com" -Department "IT"

# Get user's groups
Get-MgUserMemberOf -UserId "user@domain.com"
```

### Groups
```powershell
# Get all M365 groups
Get-MgGroup -Filter "groupTypes/any(c:c eq 'Unified')" -All

# Create M365 group
New-MgGroup -DisplayName "Project Team" `
    -MailEnabled $true `
    -MailNickname "projectteam" `
    -SecurityEnabled $false `
    -GroupTypes "Unified"

# Add member to group
New-MgGroupMember -GroupId "group-id" -DirectoryObjectId "user-id"

# Get group owners
Get-MgGroupOwner -GroupId "group-id"
```

### Teams
```powershell
# Get all teams
Get-MgTeam -All

# Create team
New-MgTeam -DisplayName "Project Team" `
    -Description "Team for Project X" `
    -Visibility Private

# Add member to team
New-MgTeamMember -TeamId "team-id" `
    -Roles @("member") `
    -AdditionalProperties @{
        "@odata.type" = "#microsoft.graph.aadUserConversationMember"
        "user@odata.bind" = "https://graph.microsoft.com/v1.0/users('user-id')"
    }
```

### Mail
```powershell
# Send mail
Send-MgUserMail -UserId "user@domain.com" `
    -Message @{
        Subject = "Test Email"
        Body = @{ContentType = "Text"; Content = "Hello"}
        ToRecipients = @(@{EmailAddress = @{Address = "recipient@domain.com"}})
    }

# Get mailbox settings
Get-MgUserMailboxSetting -UserId "user@domain.com"
```

### Licenses
```powershell
# Get available SKUs
Get-MgSubscribedSku | Select-Object SkuPartNumber, ConsumedUnits, @{N='Available';E={$_.PrepaidUnits.Enabled - $_.ConsumedUnits}}

# Assign license
Set-MgUserLicense -UserId "user@domain.com" `
    -AddLicenses @{SkuId = "sku-id"} `
    -RemoveLicenses @()

# Get user licenses
Get-MgUserLicenseDetail -UserId "user@domain.com"
```

## Required Permissions

| Operation | Delegated | Application |
|-----------|-----------|-------------|
| Read users | User.Read.All | User.Read.All |
| Create users | User.ReadWrite.All | User.ReadWrite.All |
| Read groups | Group.Read.All | Group.Read.All |
| Manage groups | Group.ReadWrite.All | Group.ReadWrite.All |
| Read mail | Mail.Read | Mail.Read |
| Send mail | Mail.Send | Mail.Send |
| Manage licenses | Organization.ReadWrite.All | Organization.ReadWrite.All |

## Batch Operations

```powershell
# Batch requests for efficiency
$batchRequests = @()
foreach ($user in $users) {
    $batchRequests += @{
        id = $user.Id
        method = "GET"
        url = "/users/$($user.Id)/memberOf"
    }
}

$response = Invoke-MgGraphRequest -Method POST -Uri '/$batch' `
    -Body @{requests = $batchRequests}
```

## Pagination

```powershell
# Automatic with -All
$allUsers = Get-MgUser -All

# Manual pagination
$users = @()
$uri = "https://graph.microsoft.com/v1.0/users?`$top=100"

do {
    $response = Invoke-MgGraphRequest -Uri $uri
    $users += $response.value
    $uri = $response.'@odata.nextLink'
} while ($uri)
```

## Error Handling

```powershell
try {
    Get-MgUser -UserId "nonexistent@domain.com"
}
catch {
    if ($_.Exception.Message -like "*ResourceNotFound*") {
        Write-Warning "User not found"
    }
    elseif ($_.Exception.Message -like "*Insufficient privileges*") {
        Write-Error "Missing required permissions"
    }
    else {
        throw
    }
}
```
