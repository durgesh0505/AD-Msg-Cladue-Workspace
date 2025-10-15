# PowerShell Patterns and Best Practices

Quick reference for common PowerShell patterns used in this workspace.

## Script Template

```powershell
<#
.SYNOPSIS
    Brief description

.DESCRIPTION
    Detailed description

.PARAMETER ParameterName
    Parameter description

.EXAMPLE
    Example usage

.NOTES
    Prerequisites and permissions
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$Parameter
)

try {
    Write-Verbose "Starting operation..."
    # Your code here
    Write-Verbose "Completed successfully"
}
catch {
    Write-Error "Error: $_"
    throw
}
```

## Error Handling

```powershell
# Try-catch with specific error types
try {
    Get-ADUser -Identity "nonexistent"
}
catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
    Write-Warning "User not found"
}
catch {
    Write-Error "Unexpected error: $_"
}

# ErrorAction preference
Get-ADUser -Identity "user" -ErrorAction Stop  # Throw exception
Get-ADUser -Identity "user" -ErrorAction SilentlyContinue  # Suppress errors
```

## Credential Management

```powershell
# Secure credential prompt
$credential = Get-Credential -Message "Enter admin credentials"

# From Azure Key Vault
$secret = Get-AzKeyVaultSecret -VaultName "MyVault" -Name "AdminPassword"
$credential = New-Object PSCredential("admin", $secret.SecretValue)

# Never hardcode credentials
# ❌ $password = "MyPassword123"
# ✅ $password = Read-Host "Password" -AsSecureString
```

## Progress Reporting

```powershell
$users = 1..100
$total = $users.Count

foreach ($i in $users) {
    $percent = ($i / $total) * 100
    Write-Progress -Activity "Processing Users" `
        -Status "User $i of $total" `
        -PercentComplete $percent

    # Do work
    Start-Sleep -Milliseconds 100
}

Write-Progress -Activity "Processing Users" -Completed
```

## CSV Import/Export

```powershell
# Import with validation
$users = Import-Csv -Path "users.csv"
foreach ($user in $users) {
    if ([string]::IsNullOrEmpty($user.Email)) {
        Write-Warning "Row missing email: $($user.Name)"
        continue
    }
    # Process valid rows
}

# Export with formatting
$results | Select-Object Name, Email, Status |
    Export-Csv -Path "results.csv" -NoTypeInformation
```

## Logging

```powershell
# Simple logging
$logFile = "C:\Logs\script_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"
    Add-Content -Path $logFile -Value $logMessage
    Write-Host $logMessage
}

Write-Log "Script started"
Write-Log "Error occurred" -Level "ERROR"
```

## Parallel Processing

```powershell
# ForEach-Object -Parallel (PowerShell 7+)
$servers = 1..10
$servers | ForEach-Object -Parallel {
    Test-Connection -ComputerName "Server$_" -Count 1
} -ThrottleLimit 5

# Jobs (PowerShell 5.1)
$jobs = foreach ($server in $servers) {
    Start-Job -ScriptBlock {
        param($srv)
        Test-Connection -ComputerName $srv -Count 1
    } -ArgumentList "Server$server"
}
$jobs | Wait-Job | Receive-Job
```

## Module Loading

```powershell
# Check if module exists
if (Get-Module -ListAvailable -Name ActiveDirectory) {
    Import-Module ActiveDirectory -ErrorAction Stop
} else {
    throw "ActiveDirectory module not found. Install RSAT tools."
}

# Version check
$module = Get-Module -ListAvailable Microsoft.Graph | Sort-Object Version -Descending | Select-Object -First 1
if ($module.Version -lt [version]"2.0.0") {
    Write-Warning "Microsoft.Graph module version $($module.Version) is outdated. Update recommended."
}
```

## Common Filters and Queries

```powershell
# AD Filter
Get-ADUser -Filter "Enabled -eq `$true -and Department -eq 'IT'"

# Graph Filter
Get-MgUser -Filter "department eq 'IT' and accountEnabled eq true"

# Where-Object filtering
$users | Where-Object {$_.LastLogon -lt (Get-Date).AddDays(-90)}

# Select-Object for custom properties
$users | Select-Object Name,
    @{N='LastLogonDays'; E={(New-TimeSpan -Start $_.LastLogon).Days}}
```
