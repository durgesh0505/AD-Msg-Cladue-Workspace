Perform Active Directory administrative operations using latest ActiveDirectory module.

## Usage

```bash
/ad-admin "[description of AD operation]"
```

## Examples

### User Management
```bash
/ad-admin "Bulk create users from CSV with columns: FirstName, LastName, Email, Department, Manager"
/ad-admin "Reset passwords for all users in Marketing OU, force change at next logon"
/ad-admin "Disable all user accounts that haven't logged in for 90+ days"
/ad-admin "Export all users with their group memberships to CSV"
```

### Group Management
```bash
/ad-admin "Create security group 'IT-Admins' and add users from CSV"
/ad-admin "Generate report of all groups with members count"
/ad-admin "Remove user from all groups except Domain Users"
```

### Computer Management
```bash
/ad-admin "Find all computers that haven't communicated with DC for 30+ days"
/ad-admin "Move computers matching pattern 'LAPTOP-*' to Laptops OU"
```

### OU and GPO
```bash
/ad-admin "Create OU structure: Departments -> IT, HR, Finance with sub-OUs"
/ad-admin "Generate report of all GPOs and their link locations"
```

### Replication and Health
```bash
/ad-admin "Check AD replication status across all DCs"
/ad-admin "Force replication between DC1 and DC2"
/ad-admin "Run dcdiag health check and export results"
```

## Features

- Uses Context7 for latest ActiveDirectory module cmdlets
- Includes error handling and logging
- Progress reporting for batch operations
- Rollback procedures for critical operations
- Prerequisites and permissions documentation
- Saves scripts to `scripts/AD/`

## Integration

- Context7 MCP: Latest cmdlet documentation
- AD Expert Agent: Automatically activated for complex operations
- Sequential Thinking: Used for troubleshooting scenarios
