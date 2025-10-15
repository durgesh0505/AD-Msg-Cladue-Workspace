Perform Exchange Server and Exchange Online administrative operations.

## Usage

```bash
/exchange-admin "[description of Exchange operation]"
```

## Examples

### Mailbox Management
```bash
/exchange-admin "Create mailboxes for new users from CSV"
/exchange-admin "Generate mailbox size report sorted by size descending"
/exchange-admin "Enable archive mailbox for users with mailbox size > 50GB"
/exchange-admin "Set mailbox quota to 50GB for all users in Sales department"
```

### Mail Flow
```bash
/exchange-admin "Test mail flow between Exchange on-prem and Exchange Online"
/exchange-admin "Generate transport rule report with all rules and conditions"
/exchange-admin "Track message from sender@domain.com to recipient@external.com"
/exchange-admin "Export send connector configuration"
```

### Migration
```bash
/exchange-admin "Create mailbox move batch to Exchange Online for users from CSV"
/exchange-admin "Generate migration status report for all batches"
/exchange-admin "Complete mailbox migration batch and finalize cutover"
```

### Distribution Groups and Contacts
```bash
/exchange-admin "Create distribution group with members from CSV"
/exchange-admin "Export all distribution lists with members"
/exchange-admin "Convert distribution group to Microsoft 365 group"
```

### Hybrid Configuration
```bash
/exchange-admin "Check Exchange hybrid configuration status"
/exchange-admin "Test hybrid mail flow connectivity"
/exchange-admin "Generate hybrid deployment report"
```

### Calendar and Permissions
```bash
/exchange-admin "Grant calendar permissions for executive assistant"
/exchange-admin "Export all mailbox folder permissions"
/exchange-admin "Set default calendar sharing policy to 'Limited Details'"
```

### Compliance
```bash
/exchange-admin "Place legal hold on mailboxes from CSV"
/exchange-admin "Export mailbox audit logs for specific user"
/exchange-admin "Generate report of retention policies applied to mailboxes"
```

## Features

- Uses Context7 for latest ExchangeOnlineManagement module
- Supports both on-premises and Exchange Online
- Hybrid scenario operations
- Mail flow troubleshooting
- Migration batch management
- Saves scripts to `scripts/Exchange/`

## Integration

- Context7 MCP: Latest Exchange cmdlets
- Exchange Expert Agent: Complex mail flow and migration scenarios
- Sequential Thinking: Troubleshooting workflows
