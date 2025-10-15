Perform Microsoft 365 administrative operations (Teams, SharePoint, OneDrive, Licensing).

## Usage

```bash
/m365-admin "[description of M365 operation]"
```

## Examples

### Licensing
```bash
/m365-admin "Generate report of all M365 licenses: assigned, available, and usage"
/m365-admin "Find users with E5 licenses who only use basic features"
/m365-admin "Bulk assign Microsoft 365 E3 licenses to users from CSV"
```

### Teams Administration
```bash
/m365-admin "Generate report of all Teams with external users"
/m365-admin "Create new Team with specified owners and members from CSV"
/m365-admin "Export all Teams policies (messaging, meeting, calling)"
/m365-admin "Apply Teams governance policy: disable guest access for Finance teams"
```

### SharePoint Administration
```bash
/m365-admin "List all SharePoint sites with storage usage"
/m365-admin "Set external sharing to 'Existing guests only' for all sites"
/m365-admin "Generate report of SharePoint site permissions"
```

### OneDrive
```bash
/m365-admin "Set OneDrive storage quota to 5TB for all users"
/m365-admin "Generate OneDrive usage report by department"
/m365-admin "Bulk provision OneDrive for users from CSV"
```

### Power Platform
```bash
/m365-admin "List all Power Apps and their creators"
/m365-admin "Export all Power Automate flows with connection details"
/m365-admin "Generate Power BI workspace usage report"
```

### Security & Compliance
```bash
/m365-admin "Export all retention policies and labels"
/m365-admin "Generate report of DLP policy matches from last 30 days"
```

## Features

- Uses Context7 for latest M365 modules
- Covers Teams, SharePoint, OneDrive, Power Platform
- License optimization analysis
- Compliance and governance operations
- Saves scripts to `scripts/M365/`

## Integration

- Context7 MCP: Latest Microsoft Graph and M365 cmdlets
- Microsoft Graph Expert Agent: Complex operations
