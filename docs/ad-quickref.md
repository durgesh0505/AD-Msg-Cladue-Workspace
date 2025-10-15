# Active Directory Quick Reference

## Authentication & Connection

```powershell
# Import module
Import-Module ActiveDirectory

# Connect to specific domain controller
Get-ADUser -Identity "username" -Server "dc01.domain.com"

# Get current domain
Get-ADDomain

# Get forest information
Get-ADForest

# Get all domain controllers
Get-ADDomainController -Filter *
```

## User Management

### Get Users
```powershell
# Get all users
Get-ADUser -Filter * -Properties *

# Get specific user with all properties
Get-ADUser -Identity "username" -Properties *

# Get users by filter
Get-ADUser -Filter "Enabled -eq `$true"
Get-ADUser -Filter "Department -eq 'IT' -and Enabled -eq `$true"

# Get disabled users
Get-ADUser -Filter "Enabled -eq `$false"

# Get users from specific OU
Get-ADUser -Filter * -SearchBase "OU=Users,OU=IT,DC=domain,DC=com"

# Get inactive users (no login in 90 days)
$date = (Get-Date).AddDays(-90)
Get-ADUser -Filter {LastLogonDate -lt $date -and Enabled -eq $true} -Properties LastLogonDate
```

### Create Users
```powershell
# Create new user
New-ADUser -Name "John Doe" `
    -GivenName "John" `
    -Surname "Doe" `
    -SamAccountName "jdoe" `
    -UserPrincipalName "jdoe@domain.com" `
    -Path "OU=Users,DC=domain,DC=com" `
    -AccountPassword (ConvertTo-SecureString "TempPassword123!" -AsPlainText -Force) `
    -Enabled $true `
    -ChangePasswordAtLogon $true `
    -Department "IT" `
    -Title "System Administrator"
```

### Modify Users
```powershell
# Update user properties
Set-ADUser -Identity "jdoe" -Department "Engineering" -Title "Engineer"

# Set password never expires
Set-ADUser -Identity "jdoe" -PasswordNeverExpires $true

# Enable/disable user
Enable-ADAccount -Identity "jdoe"
Disable-ADAccount -Identity "jdoe"

# Unlock user account
Unlock-ADAccount -Identity "jdoe"

# Reset password
Set-ADAccountPassword -Identity "jdoe" -Reset -NewPassword (ConvertTo-SecureString "NewPassword123!" -AsPlainText -Force)

# Force password change at next login
Set-ADUser -Identity "jdoe" -ChangePasswordAtLogon $true

# Move user to different OU
Move-ADObject -Identity "CN=John Doe,OU=Users,DC=domain,DC=com" -TargetPath "OU=IT,DC=domain,DC=com"
```

### Delete Users
```powershell
# Remove user
Remove-ADUser -Identity "jdoe" -Confirm:$false
```

## Group Management

### Get Groups
```powershell
# Get all groups
Get-ADGroup -Filter *

# Get specific group with members
Get-ADGroup -Identity "IT-Team" -Properties *
Get-ADGroupMember -Identity "IT-Team"

# Get groups by type
Get-ADGroup -Filter "GroupScope -eq 'Global' -and GroupCategory -eq 'Security'"

# Get user's group memberships
Get-ADUser -Identity "jdoe" -Properties MemberOf | Select-Object -ExpandProperty MemberOf

# Get nested group members (recursive)
Get-ADGroupMember -Identity "IT-Team" -Recursive
```

### Create Groups
```powershell
# Create security group
New-ADGroup -Name "IT-Team" `
    -GroupScope Global `
    -GroupCategory Security `
    -Path "OU=Groups,DC=domain,DC=com" `
    -Description "IT Department Team"

# Create distribution group
New-ADGroup -Name "IT-Distribution" `
    -GroupScope Universal `
    -GroupCategory Distribution `
    -Path "OU=Groups,DC=domain,DC=com"
```

### Modify Groups
```powershell
# Add member to group
Add-ADGroupMember -Identity "IT-Team" -Members "jdoe"

# Add multiple members
Add-ADGroupMember -Identity "IT-Team" -Members "jdoe", "asmith", "bjones"

# Remove member from group
Remove-ADGroupMember -Identity "IT-Team" -Members "jdoe" -Confirm:$false

# Update group properties
Set-ADGroup -Identity "IT-Team" -Description "Updated description"
```

## Computer Management

```powershell
# Get all computers
Get-ADComputer -Filter *

# Get enabled computers
Get-ADComputer -Filter "Enabled -eq `$true"

# Get computers by OS
Get-ADComputer -Filter "OperatingSystem -like '*Windows 10*'" -Properties OperatingSystem

# Get inactive computers (no login in 90 days)
$date = (Get-Date).AddDays(-90)
Get-ADComputer -Filter {LastLogonDate -lt $date} -Properties LastLogonDate

# Get computer details
Get-ADComputer -Identity "COMPUTER01" -Properties *

# Create computer account
New-ADComputer -Name "COMPUTER01" -Path "OU=Computers,DC=domain,DC=com"

# Remove computer
Remove-ADComputer -Identity "COMPUTER01" -Confirm:$false

# Enable/disable computer
Enable-ADAccount -Identity "COMPUTER01$"
Disable-ADAccount -Identity "COMPUTER01$"
```

## Organizational Units (OU)

```powershell
# Get all OUs
Get-ADOrganizationalUnit -Filter *

# Get specific OU
Get-ADOrganizationalUnit -Identity "OU=IT,DC=domain,DC=com"

# Create OU
New-ADOrganizationalUnit -Name "IT" -Path "DC=domain,DC=com" -ProtectedFromAccidentalDeletion $true

# Delete OU (must remove protection first)
Set-ADOrganizationalUnit -Identity "OU=IT,DC=domain,DC=com" -ProtectedFromAccidentalDeletion $false
Remove-ADOrganizationalUnit -Identity "OU=IT,DC=domain,DC=com" -Confirm:$false

# Get objects in OU
Get-ADObject -Filter * -SearchBase "OU=IT,DC=domain,DC=com"
```

## Group Policy (GPO)

```powershell
# Import GPO module
Import-Module GroupPolicy

# Get all GPOs
Get-GPO -All

# Get specific GPO
Get-GPO -Name "Default Domain Policy"

# Create new GPO
New-GPO -Name "IT Security Policy" -Comment "Security settings for IT department"

# Link GPO to OU
New-GPLink -Name "IT Security Policy" -Target "OU=IT,DC=domain,DC=com" -LinkEnabled Yes

# Get GPO links
Get-GPInheritance -Target "OU=IT,DC=domain,DC=com"

# Backup GPO
Backup-GPO -Name "IT Security Policy" -Path "C:\GPOBackups"

# Restore GPO
Restore-GPO -Name "IT Security Policy" -Path "C:\GPOBackups"

# Generate GPO report
Get-GPOReport -Name "IT Security Policy" -ReportType Html -Path "C:\Reports\GPO.html"

# Force GPO update on remote computer
Invoke-GPUpdate -Computer "COMPUTER01" -Force

# Force local GPO update
gpupdate /force
```

## Replication & Health

```powershell
# Check replication status
repadmin /showrepl

# Force replication
repadmin /syncall /AdeP

# Check replication partners
Get-ADReplicationPartnerMetadata -Target "dc01.domain.com"

# Get replication failures
Get-ADReplicationFailure -Target "dc01.domain.com"

# Test domain controller
dcdiag /s:dc01 /v

# Check FSMO roles
Get-ADDomain | Select-Object PDCEmulator, RIDMaster, InfrastructureMaster
Get-ADForest | Select-Object SchemaMaster, DomainNamingMaster

# Transfer FSMO roles
Move-ADDirectoryServerOperationMasterRole -Identity "DC02" -OperationMasterRole PDCEmulator

# Check DNS
nslookup domain.com
Test-DnsServer -IPAddress 10.0.0.1

# Check network connectivity
Test-Connection -ComputerName dc01.domain.com
Test-NetConnection -ComputerName dc01.domain.com -Port 389
```

## Trusts

```powershell
# Get domain trusts
Get-ADTrust -Filter *

# Create trust (run on both domains)
New-ADTrust -Name "trusteddomain.com" `
    -Direction Bidirectional `
    -TrustType Forest

# Verify trust
Test-ADTrust -Identity "trusteddomain.com"

# Remove trust
Remove-ADTrust -Identity "trusteddomain.com" -Confirm:$false
```

## Permissions & Delegation

```powershell
# Get ACL for AD object
$acl = Get-Acl -Path "AD:\OU=IT,DC=domain,DC=com"
$acl.Access

# Delegate permissions
$ou = "OU=IT,DC=domain,DC=com"
$user = Get-ADUser -Identity "jdoe"
$acl = Get-Acl -Path "AD:\$ou"

# Create new access rule
$identity = $user.SID
$adRights = [System.DirectoryServices.ActiveDirectoryRights]::CreateChild -bor [System.DirectoryServices.ActiveDirectoryRights]::DeleteChild
$type = [System.Security.AccessControl.AccessControlType]::Allow
$inheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance]::All

$ace = New-Object System.DirectoryServices.ActiveDirectoryAccessRule($identity, $adRights, $type, $inheritanceType)
$acl.AddAccessRule($ace)
Set-Acl -Path "AD:\$ou" -AclObject $acl
```

## Search & Filtering

```powershell
# LDAP filters
Get-ADUser -LDAPFilter "(department=IT)"
Get-ADUser -LDAPFilter "(&(department=IT)(enabled=TRUE))"
Get-ADUser -LDAPFilter "(|(department=IT)(department=Engineering))"

# Property-based filters
Get-ADUser -Filter {Department -eq "IT" -and Enabled -eq $true}

# Wildcard searches
Get-ADUser -Filter "Name -like '*Smith'"

# Multiple properties
Get-ADUser -Filter * -Properties Department, Title, LastLogonDate |
    Where-Object {$_.LastLogonDate -gt (Get-Date).AddDays(-30)} |
    Select-Object Name, Department, Title, LastLogonDate
```

## Bulk Operations

```powershell
# Bulk user creation from CSV
# CSV format: FirstName,LastName,Username,Department
Import-Csv "users.csv" | ForEach-Object {
    New-ADUser -Name "$($_.FirstName) $($_.LastName)" `
        -GivenName $_.FirstName `
        -Surname $_.LastName `
        -SamAccountName $_.Username `
        -UserPrincipalName "$($_.Username)@domain.com" `
        -Department $_.Department `
        -Enabled $true `
        -AccountPassword (ConvertTo-SecureString "TempPass123!" -AsPlainText -Force) `
        -ChangePasswordAtLogon $true
}

# Bulk group membership
$users = Import-Csv "users.csv"
$users | ForEach-Object {
    Add-ADGroupMember -Identity "IT-Team" -Members $_.Username
}

# Bulk disable inactive users
$date = (Get-Date).AddDays(-90)
Get-ADUser -Filter {LastLogonDate -lt $date -and Enabled -eq $true} -Properties LastLogonDate |
    ForEach-Object {
        Disable-ADAccount -Identity $_.SamAccountName
        Write-Host "Disabled: $($_.Name)"
    }
```

## Common Filters

```powershell
# Enabled users only
-Filter "Enabled -eq `$true"

# Specific department
-Filter "Department -eq 'IT'"

# Password never expires
-Filter "PasswordNeverExpires -eq `$true"

# Account locked
-Filter "LockedOut -eq `$true"

# Password expired
-Filter "PasswordExpired -eq `$true"

# User must change password
-Filter "PasswordLastSet -eq 0"

# Multiple conditions (AND)
-Filter "Enabled -eq `$true -and Department -eq 'IT'"

# Multiple conditions (OR)
-Filter "(Department -eq 'IT') -or (Department -eq 'Engineering')"

# Wildcard
-Filter "Name -like '*Smith*'"
```

## Export/Report Examples

```powershell
# Export all users to CSV
Get-ADUser -Filter * -Properties * |
    Select-Object Name, SamAccountName, EmailAddress, Department, Enabled |
    Export-Csv "users.csv" -NoTypeInformation

# Export group membership
Get-ADGroupMember -Identity "IT-Team" |
    Select-Object Name, SamAccountName, objectClass |
    Export-Csv "it-team-members.csv" -NoTypeInformation

# Password expiration report
Get-ADUser -Filter {Enabled -eq $true -and PasswordNeverExpires -eq $false} -Properties PasswordLastSet, PasswordNeverExpires |
    Select-Object Name, SamAccountName,
        @{N='PasswordLastSet';E={$_.PasswordLastSet}},
        @{N='DaysUntilExpire';E={(New-TimeSpan -Start (Get-Date) -End ($_.PasswordLastSet.AddDays(90))).Days}} |
    Export-Csv "password-expiration.csv" -NoTypeInformation

# Inactive accounts report
$date = (Get-Date).AddDays(-90)
Get-ADUser -Filter * -Properties LastLogonDate |
    Where-Object {$_.LastLogonDate -lt $date -or $_.LastLogonDate -eq $null} |
    Select-Object Name, SamAccountName, Enabled, LastLogonDate |
    Export-Csv "inactive-users.csv" -NoTypeInformation
```
