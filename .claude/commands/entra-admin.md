Perform Entra ID (Azure AD) administrative operations using Microsoft Graph.

## Usage

```bash
/entra-admin "[description of Entra ID operation]"
```

## Examples

### User Management
```bash
/entra-admin "Create cloud-only users from CSV with default password"
/entra-admin "Bulk assign licenses to users in Finance department"
/entra-admin "Generate report of MFA status for all users"
/entra-admin "Enable Conditional Access for external users"
```

### Group Management
```bash
/entra-admin "Create dynamic group for all users in IT department"
/entra-admin "Export all Azure AD groups with owners and members"
/entra-admin "Add users to Azure AD security group from CSV"
```

### Application Management
```bash
/entra-admin "List all enterprise applications with sign-in activity"
/entra-admin "Grant application permissions to managed identity"
/entra-admin "Generate report of service principals and their permissions"
```

### Security
```bash
/entra-admin "Export all Conditional Access policies"
/entra-admin "List users with privileged roles (Global Admin, etc.)"
/entra-admin "Generate report of risky sign-ins from last 7 days"
```

### Hybrid Identity
```bash
/entra-admin "Check Azure AD Connect sync status"
/entra-admin "List all synced users with sync errors"
/entra-admin "Force delta sync from Azure AD Connect"
```

## Features

- Uses Context7 for latest Microsoft Graph cmdlets
- Handles authentication (delegated/application)
- Required API permissions documented
- Hybrid identity scenario support
- Saves scripts to `scripts/EntraID/`

## Integration

- Context7 MCP: Latest Graph API documentation
- Microsoft Graph Expert Agent: Complex operations
- Handles both AzureAD and Microsoft.Graph modules
