Perform Microsoft Purview compliance and data governance operations.

## Usage

```bash
/purview-admin "[description of Purview operation]"
```

## Examples

### Retention Policies
```bash
/purview-admin "Create retention policy for SharePoint sites: retain 7 years, then delete"
/purview-admin "Generate report of all retention policies and their scope"
/purview-admin "Apply retention label to documents in specific SharePoint library"
```

### Data Loss Prevention (DLP)
```bash
/purview-admin "Create DLP policy to block sharing of documents with credit card numbers"
/purview-admin "Generate DLP policy match report for last 30 days"
/purview-admin "Export all DLP policies with rules and conditions"
```

### Sensitivity Labels
```bash
/purview-admin "Create sensitivity label 'Confidential' with encryption"
/purview-admin "Publish sensitivity labels to all users"
/purview-admin "Generate report of sensitivity label usage across organization"
```

### eDiscovery
```bash
/purview-admin "Create eDiscovery case for legal investigation"
/purview-admin "Search mailboxes for keyword 'project falcon' in date range"
/purview-admin "Export eDiscovery search results to PST"
```

### Audit Logging
```bash
/purview-admin "Search unified audit log for admin activity last 7 days"
/purview-admin "Export audit logs for specific user to CSV"
/purview-admin "Generate report of all file deletions in SharePoint"
```

### Information Barriers
```bash
/purview-admin "Create information barrier policy to separate departments"
/purview-admin "Generate report of information barrier violations"
```

### Insider Risk Management
```bash
/purview-admin "Generate insider risk alerts report"
/purview-admin "Export user activity patterns for compliance review"
```

### Communication Compliance
```bash
/purview-admin "Create communication compliance policy for financial regulation"
/purview-admin "Generate report of policy violations by department"
```

## Features

- Uses Context7 for latest Purview PowerShell modules
- Compliance and governance operations
- eDiscovery and legal hold management
- DLP policy creation and reporting
- Audit log search and export
- Saves scripts to `scripts/Purview/`

## Integration

- Context7 MCP: Latest Purview cmdlets and Graph API
- Microsoft Graph Expert Agent: Complex compliance operations
- Compliance center integration
