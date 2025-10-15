# Personal IT Admin Workspace - Claude Instructions

**Workspace Purpose**: Personal productivity tools for IT administration and script generation

## User Profile

**Role**: IT Administrator / PowerShell Developer
**Primary Tasks**:
- PowerShell script generation for admin automation
- Azure infrastructure deployment and management
- Microsoft 365 and Entra ID administration
- Exchange Server and Exchange Online management
- Microsoft Graph API operations
- Web application deployment (Azure Static Web Apps)

## Critical Requirements

### 1. Always Use Latest Documentation
**REQUIRED**: Always use Context7 MCP to fetch latest documentation before generating code.

❌ **Never rely on training data for**:
- Microsoft Graph SDK cmdlets
- Azure CLI commands
- PowerShell module versions
- Azure Static Web Apps features
- Microsoft 365 admin APIs

✅ **Always use Context7 for**:
- ActiveDirectory PowerShell module
- Az PowerShell module
- Microsoft.Graph PowerShell SDK
- ExchangeOnlineManagement module
- Azure CLI commands
- GitHub Actions syntax
- Azure Static Web Apps configuration

**Pattern**:
```
User request → Context7 (fetch latest docs) → Generate code using current APIs → Deliver
```

### 2. PowerShell Script Standards

Every PowerShell script must include:
- **Error handling**: Try-catch blocks with meaningful error messages
- **Parameter validation**: [CmdletBinding()] and proper parameter attributes
- **Logging**: Write-Verbose for operations, Write-Error for failures
- **Comments**: Explain complex logic, document prerequisites
- **Module imports**: Explicit Import-Module with version checking when critical
- **Credential handling**: Never hardcode credentials, use SecureString or Azure Key Vault
- **Output formatting**: Consistent output (objects for pipelines, formatted for display)

**Template Pattern**:
```powershell
<#
.SYNOPSIS
    Brief description

.DESCRIPTION
    Detailed description

.PARAMETER ParameterName
    Description

.EXAMPLE
    Example usage

.NOTES
    Prerequisites:
    - Required modules
    - Required permissions
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$Parameter1
)

try {
    # Main logic with verbose output
    Write-Verbose "Starting operation..."

    # Your code here

    Write-Verbose "Operation completed successfully"
}
catch {
    Write-Error "Operation failed: $_"
    throw
}
```

### 3. GUI Script Standards (WPF/XAML with Dark Theme)

**REQUIRED**: All PowerShell GUI scripts MUST use WPF/XAML with the comprehensive dark theme from `docs/PowerShell-GUI-Dark-Theme-Reference.md`.

**Dark Theme Requirements**:
- ✅ **Use dark theme reference**: `docs/PowerShell-GUI-Dark-Theme-Reference.md`
- ✅ **Primary background**: #1E1E1E (main window)
- ✅ **Control background**: #2D2D2D (TextBox, ComboBox, etc.)
- ✅ **Text color**: #FFFFFF (primary text)
- ✅ **Accent color**: #0078D4 (Microsoft blue for buttons, selections)
- ✅ **Include all control styles**: TextBox, Button, ComboBox, DataGrid, ListView, etc.
- ✅ **State styling**: ReadOnly (#1A1A1A), Disabled (#666666), Focus (#0078D4 border)

**When generating GUI scripts**:
- Use WPF/XAML (not Windows Forms)
- Embed complete dark theme styles in Window.Resources
- Copy all required control styles from the reference guide
- Include proper event handlers
- Add input validation before processing
- Provide visual feedback (ProgressBar, status text)
- Handle GUI threading properly (no UI freezing)
- Include error dialogs for user-friendly error reporting
- Follow Microsoft Fluent Design principles

**Theme Reference**: The complete theme guide includes:
- All control styles (TextBox, Button, ComboBox, ListView, DataGrid, etc.)
- ReadOnly, Disabled, and Focus state styling
- High contrast accessibility compliance
- Professional Microsoft appearance
- Drop shadows and modern effects

### 4. Azure Deployment Standards

For Azure deployments:
- Always use Azure CLI or Az PowerShell (latest from Context7)
- Include resource naming conventions (environment, purpose, region)
- Tag all resources (Project, Environment, Owner, CostCenter)
- Use managed identities where possible (avoid service principals)
- Configure monitoring and alerts
- Document estimated costs
- Include cleanup scripts

### 5. Microsoft Graph Operations

For Microsoft Graph scripts:
- Always check latest SDK version via Context7
- Document required API permissions (delegated vs application)
- Include authentication examples (interactive, app-only, certificate)
- Use proper scopes (least privilege)
- Implement error handling for throttling (429 errors)
- Use batch operations for efficiency when querying multiple items
- Include pagination for large result sets

## Slash Commands Available

### PowerShell Generation
- `/ps-script "[description]"` - Generate PowerShell script
- `/ps-gui "[description]"` - Generate PowerShell script with Windows Forms GUI
- `/ps-graph "[description]"` - Generate Microsoft Graph PowerShell script
- `/ps-azure "[description]"` - Generate Azure PowerShell script

### Web Development
- `/webapp-deploy "[description]"` - Deploy to Azure Static Web App
- `/storage-setup "[description]"` - Configure Azure Storage Account
- `/github-workflow "[description]"` - Create GitHub Actions workflow

### Admin Operations
- `/ad-admin "[operation]"` - Active Directory operation
- `/entra-admin "[operation]"` - Entra ID operation
- `/m365-admin "[operation]"` - Microsoft 365 operation
- `/exchange-admin "[operation]"` - Exchange operation
- `/purview-admin "[operation]"` - Purview compliance operation

## Specialized Agents Available

- `@powershell-builder` - PowerShell script expert
- `@azure-deployer` - Azure deployment specialist
- `@microsoft-graph-expert` - Microsoft Graph API specialist
- `@ad-expert` - Active Directory specialist
- `@exchange-expert` - Exchange specialist

## Workflow Patterns

### Pattern 1: Generate PowerShell Script
```
User: /ps-script "Create AD user bulk import from CSV with error logging"

Process:
1. Context7: Fetch latest ActiveDirectory module cmdlets
2. Generate script with:
   - CSV import with validation
   - New-ADUser with error handling
   - Progress reporting
   - Error log file output
3. Save to scripts/AD/ with descriptive name
4. Provide usage instructions
```

### Pattern 2: Generate Script with GUI (WPF/XAML Dark Theme)
```
User: /ps-gui "AD user search tool showing user properties"

Process:
1. Reference: Review dark theme guide in docs/PowerShell-GUI-Dark-Theme-Reference.md
2. Context7: Fetch latest WPF/XAML best practices
3. Generate script with:
   - WPF/XAML UI with complete dark theme styles embedded
   - Primary background #1E1E1E, controls #2D2D2D, accent #0078D4
   - Modern controls (TextBox, DataGrid, ProgressBar, etc.)
   - Event handlers for search button
   - Data binding to display results
   - Error handling for AD queries
   - Professional Microsoft Fluent Design appearance
4. Save to scripts/AD/ directory
5. Provide instructions to run
```

### Pattern 3: Deploy Web App
```
User: /webapp-deploy "Deploy React app to Azure Static Web App"

Process:
1. Context7: Fetch latest Azure Static Web Apps CLI
2. Check for existing Azure Static Web App or create new
3. Generate GitHub Actions workflow
4. Configure build settings for React
5. Deploy and provide URL
6. Document custom domain setup if needed
```

### Pattern 4: Microsoft Graph Operation
```
User: /ps-graph "Get all M365 groups and export owners to CSV"

Process:
1. Context7: Fetch latest Microsoft.Graph.Groups cmdlets
2. Generate script with:
   - Connect-MgGraph with appropriate scopes
   - Get-MgGroup with filtering
   - Get-MgGroupOwner for each group
   - Export-Csv with proper formatting
3. Document required permissions
4. Save to scripts/Graph/ directory
```

## File Saving Conventions

- **PowerShell scripts**: Save to `scripts/[Category]/[Descriptive-Name].ps1`
  - Example: `scripts/AD/Bulk-Create-Users-From-CSV.ps1`
  - Example: `scripts/Graph/Export-M365-Groups-And-Owners.ps1`

- **Web projects**: Save to `projects/[project-name]/`
  - Example: `projects/admin-portal/`

- **Documentation**: Add usage examples to script headers and optionally to `docs/`

## Best Practices

### Communication
- Be concise and direct
- Provide working code immediately
- Explain complex logic with inline comments
- Document prerequisites clearly
- Include example usage

### Code Quality
- Production-ready code (not experimental)
- Error handling for all external operations
- Input validation
- Proper credential management
- Logging for troubleshooting

### Documentation
- Prerequisites section (modules, permissions, access)
- Usage examples with expected output
- Troubleshooting tips for common issues
- Known limitations

### Security
- Never hardcode credentials
- Use least privilege permissions
- Validate all inputs
- Document security considerations
- Use secure connections (HTTPS, TLS)

## Context7 Integration Pattern

**For Every Code Generation**:
1. Identify the technology/module involved
2. Use Context7 to fetch latest documentation
3. Verify cmdlet names, parameters, and best practices
4. Generate code using current APIs
5. Include version requirements in comments

**Example Context7 Queries**:
- "Get latest Microsoft.Graph.Users module cmdlets"
- "Get latest Azure Static Web Apps CLI commands"
- "Get latest Az.Compute PowerShell module"
- "Get latest ExchangeOnlineManagement module authentication methods"

## Success Criteria

User request is successful when:
- [ ] Code works on first run (no syntax errors)
- [ ] Uses latest API/cmdlet versions (verified via Context7)
- [ ] Includes proper error handling
- [ ] Has clear documentation (comments, usage examples)
- [ ] Saved to appropriate directory
- [ ] Prerequisites documented
- [ ] Security best practices followed

## Quick Reference

**Documentation**: See `docs/` directory for:
- `PowerShell-GUI-Dark-Theme-Reference.md` - **REQUIRED** comprehensive dark theme for all GUI scripts
- `powershell-patterns.md` - PowerShell patterns and templates
- `azure-deployment-guide.md` - Azure deployment guides
- `microsoft-graph-examples.md` - Microsoft Graph examples
- `ad-quickref.md` - Active Directory quick reference
- `recommended-mcp-servers.md` - MCP server recommendations and setup

**MCP Servers**:
- Context7: Latest Microsoft documentation
- Sequential Thinking: Complex troubleshooting and architecture decisions
- Azure MCP: Native Azure service integration
- Microsoft Learn MCP: Real-time Microsoft Learn docs
- GitHub MCP: GitHub Actions and automation
- Memory MCP: Persistent learning across sessions
- Filesystem MCP: Secure file operations
- Git MCP: Version control operations

**Support**:
- Review slash command files in `.claude/commands/` for detailed command usage
- Review agent files in `.claude/agents/` for specialized assistance
- Check `REVISED_PLAN.md` for complete workspace architecture
- See `SETUP_MCP_SERVERS.md` for MCP server configuration
