# Revised Plan: Personal IT Admin Productivity Workspace

**Date**: 2025-01-15
**Status**: Complete Revision Based on Actual Use Case

## User's Actual Requirements

**Primary Use Cases**:
1. **PowerShell Script Generation**: Create scripts (with/without GUI) for:
   - Active Directory operations
   - Azure resource management
   - Entra ID (Azure AD) operations
   - Microsoft 365 administration
   - Exchange management
   - Microsoft Graph API operations
   - Purview compliance tasks

2. **Web Application Development**:
   - GitHub integration and workflows
   - Azure Static Web Apps deployment
   - Azure Storage Account management

3. **Latest Documentation Access**:
   - Need accurate, up-to-date information
   - Cannot rely solely on Claude's training data
   - Must use Context7 MCP for latest Microsoft SDK documentation

## What Was Wrong with Original Plan

**Original Plan**: Built a public marketplace for "AD Messaging System Engineers" with:
- 58 plugin directories across 9 categories
- Public contribution guidelines
- Quality tier system for marketplace submissions
- Plugin metadata for distribution
- Focus on serving many users

**Actual Need**: Personal productivity workspace with:
- Slash commands for their specific workflows
- Specialized agents for domain expertise
- MCP integration for latest documentation
- Simple, immediately usable tools
- Focus on one user (them)

## New Architecture: Personal Workspace

### Project Structure

```
Claude_Code_Workspace/                    # Renamed from marketplace
├── .claude/                              # Project-level Claude Code configuration
│   ├── commands/                         # Slash commands for workflows
│   │   ├── ps-script.md                  # Generate PowerShell script
│   │   ├── ps-gui.md                     # Generate PowerShell script with GUI
│   │   ├── ps-graph.md                   # Generate Microsoft Graph script
│   │   ├── ps-azure.md                   # Generate Azure PowerShell script
│   │   ├── webapp-deploy.md              # Deploy to Azure Static Web App
│   │   ├── storage-setup.md              # Configure Azure Storage
│   │   ├── github-workflow.md            # Create GitHub Actions workflow
│   │   ├── ad-admin.md                   # Active Directory operations
│   │   ├── entra-admin.md                # Entra ID operations
│   │   ├── m365-admin.md                 # M365 operations
│   │   ├── exchange-admin.md             # Exchange operations
│   │   └── purview-admin.md              # Purview operations
│   │
│   ├── agents/                           # Specialized AI agents
│   │   ├── powershell-builder.md         # PowerShell script expert
│   │   ├── azure-deployer.md             # Azure deployment expert
│   │   ├── microsoft-graph-expert.md     # Microsoft Graph API expert
│   │   ├── ad-expert.md                  # Active Directory expert
│   │   └── exchange-expert.md            # Exchange expert
│   │
│   ├── config.json                       # MCP server configuration
│   └── CLAUDE.md                         # Personal workspace instructions
│
├── docs/                                 # Quick reference guides
│   ├── powershell-patterns.md            # Common PowerShell patterns
│   ├── azure-deployment-guide.md         # Static Web Apps + Storage setup
│   ├── microsoft-graph-examples.md       # Graph SDK examples
│   ├── ad-quickref.md                    # AD cmdlet quick reference
│   └── REASONING_INTEGRATION.md          # (kept from original work)
│
├── scripts/                              # Generated PowerShell scripts
│   ├── AD/                               # Active Directory scripts
│   ├── Azure/                            # Azure scripts
│   ├── Exchange/                         # Exchange scripts
│   ├── M365/                             # M365 scripts
│   └── Graph/                            # Microsoft Graph scripts
│
├── projects/                             # Web app projects
│   └── webapp-template/                  # Template for Static Web Apps
│
└── README.md                             # Workspace overview
```

### Essential Slash Commands (12 commands)

#### PowerShell Generation (4 commands)

1. **/ps-script** - Generate PowerShell script with Context7 latest docs
   ```bash
   /ps-script "Create AD user management script with bulk import from CSV"
   ```
   - Uses Context7 to get latest ActiveDirectory module documentation
   - Generates production-ready PowerShell with error handling
   - Saves to scripts/ directory with descriptive name

2. **/ps-gui** - Generate PowerShell script with Windows Forms GUI
   ```bash
   /ps-gui "Create AD user search tool with GUI showing user properties"
   ```
   - Uses Context7 for System.Windows.Forms best practices
   - Generates WPF or Windows Forms GUI
   - Includes event handlers and data binding

3. **/ps-graph** - Generate Microsoft Graph PowerShell script
   ```bash
   /ps-graph "Get all M365 groups and their owners, export to CSV"
   ```
   - Uses Context7 for latest Microsoft.Graph PowerShell SDK
   - Handles authentication (interactive, app-only, certificate)
   - Includes proper error handling and permissions documentation

4. **/ps-azure** - Generate Azure PowerShell script
   ```bash
   /ps-azure "List all VMs in subscription with their status and cost tags"
   ```
   - Uses Context7 for latest Az PowerShell module
   - Handles Azure authentication
   - Supports resource queries, deployments, configuration

#### Web Development (3 commands)

5. **/webapp-deploy** - Deploy to Azure Static Web App
   ```bash
   /webapp-deploy "Deploy current project to Azure Static Web App"
   ```
   - Uses Context7 for latest Azure Static Web Apps CLI
   - Configures GitHub Actions workflow
   - Sets up custom domain and SSL

6. **/storage-setup** - Configure Azure Storage Account
   ```bash
   /storage-setup "Create storage account with blob containers for file uploads"
   ```
   - Uses Context7 for Azure Storage best practices
   - Configures CORS, lifecycle policies, access tiers
   - Generates connection strings and SAS tokens

7. **/github-workflow** - Create GitHub Actions workflow
   ```bash
   /github-workflow "Create CI/CD for Static Web App with automated testing"
   ```
   - Uses Context7 for latest GitHub Actions patterns
   - Creates workflow YAML with build, test, deploy stages
   - Includes secrets management

#### Admin Operations (5 commands)

8. **/ad-admin** - Active Directory operations
   ```bash
   /ad-admin "Bulk reset passwords for users in Marketing OU"
   ```
   - Uses Context7 for Active Directory module
   - Generates safe, tested AD operations
   - Includes rollback procedures

9. **/entra-admin** - Entra ID (Azure AD) operations
   ```bash
   /entra-admin "Add 50 users to Azure AD security group from CSV"
   ```
   - Uses Context7 for AzureAD or Microsoft.Graph modules
   - Handles hybrid identity scenarios
   - Includes license assignment if needed

10. **/m365-admin** - Microsoft 365 operations
    ```bash
    /m365-admin "Generate report of inactive M365 licenses"
    ```
    - Uses Context7 for M365 admin modules
    - Covers Teams, SharePoint, Exchange Online, licensing
    - Compliance and reporting focused

11. **/exchange-admin** - Exchange operations
    ```bash
    /exchange-admin "Create mailbox move batch from on-prem to Exchange Online"
    ```
    - Uses Context7 for Exchange Online Management module
    - Supports hybrid scenarios
    - Migration and mailbox management

12. **/purview-admin** - Purview compliance operations
    ```bash
    /purview-admin "Create retention policy for SharePoint sites"
    ```
    - Uses Context7 for Purview PowerShell modules
    - Compliance, DLP, retention policies
    - eDiscovery and audit operations

### Specialized Agents (5 agents)

#### 1. PowerShell Builder Agent
**Role**: Expert PowerShell script developer specializing in Microsoft admin automation

**Expertise**:
- PowerShell best practices (error handling, logging, parameter validation)
- Windows Forms and WPF GUI development
- PowerShell modules: ActiveDirectory, Az, ExchangeOnlineManagement, Microsoft.Graph
- Script security (credential handling, least privilege)

**Integration**: Always uses Context7 MCP to fetch latest module documentation before generating scripts

#### 2. Azure Deployer Agent
**Role**: Azure deployment and infrastructure specialist

**Expertise**:
- Azure Static Web Apps configuration and deployment
- Azure Storage Account management (Blob, Files, Tables, Queues)
- GitHub Actions for CI/CD pipelines
- Azure CLI and ARM templates
- Cost optimization and monitoring

**Integration**: Uses Context7 for latest Azure CLI commands and Static Web Apps features

#### 3. Microsoft Graph Expert Agent
**Role**: Microsoft Graph API and SDK specialist

**Expertise**:
- Microsoft Graph REST API
- Microsoft Graph PowerShell SDK
- Authentication flows (delegated, application, certificate-based)
- Common scenarios: user management, group operations, Teams, SharePoint, mail
- API permissions and consent

**Integration**: Uses Context7 for latest Graph API endpoints and SDK methods

#### 4. AD Expert Agent
**Role**: Active Directory on-premises specialist

**Expertise**:
- Active Directory domain services
- Group Policy administration
- AD replication and site topology
- User and computer management
- Security and permissions

**Integration**: Uses Context7 for Active Directory PowerShell module updates

#### 5. Exchange Expert Agent
**Role**: Exchange Server and Exchange Online specialist

**Expertise**:
- Exchange Server (on-premises)
- Exchange Online administration
- Hybrid Exchange configurations
- Mail flow troubleshooting
- Mailbox migrations

**Integration**: Uses Context7 for Exchange Online Management module

## MCP Configuration

### Required MCP Servers

**config.json** in `.claude/` directory:

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@context7/mcp-server"],
      "description": "Latest Microsoft documentation and SDK references"
    },
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"],
      "description": "Structured reasoning for complex decisions"
    }
  }
}
```

### Optional MCP Servers

```json
{
  "playwright": {
    "command": "npx",
    "args": ["-y", "@playwright/mcp-server"],
    "description": "Test Azure Static Web Apps after deployment"
  },
  "magic": {
    "command": "npx",
    "args": ["-y", "@magic/mcp-server"],
    "description": "Generate UI components for admin portals"
  }
}
```

## Context7 Integration Pattern

Every command and agent follows this pattern:

1. **User Request** → Slash command or agent
2. **Fetch Latest Docs** → Context7 MCP retrieves current SDK/module documentation
3. **Generate Solution** → Create script/code using latest APIs
4. **Validate** → Ensure using current best practices
5. **Deliver** → Provide working code with documentation

**Example Flow**:
```
User: /ps-graph "Get all Teams with external users"

→ Context7: Fetch latest Microsoft.Graph.Teams module docs
→ Agent: Generate script using current Connect-MgGraph, Get-MgTeam, Get-MgTeamMember cmdlets
→ Validate: Check authentication scopes documented
→ Deliver: Working PowerShell script with comments
```

## Quick Reference Documentation

### docs/powershell-patterns.md
- Common error handling patterns
- Parameter validation best practices
- Logging and output formatting
- Credential management (Azure Key Vault, SecureString)
- Module import and dependency management

### docs/azure-deployment-guide.md
- Azure Static Web Apps setup (step-by-step)
- Storage Account configuration (containers, CORS, lifecycle)
- GitHub Actions workflows for deployment
- Custom domain and SSL setup
- Cost optimization tips

### docs/microsoft-graph-examples.md
- Authentication patterns (interactive, app-only, certificate)
- Common queries (users, groups, mail, Teams, SharePoint)
- Batch operations for efficiency
- Permissions reference (delegated vs application)
- Error handling and throttling

### docs/ad-quickref.md
- Essential AD cmdlets quick reference
- OU and group management patterns
- User provisioning workflows
- Security best practices
- Troubleshooting common issues

## Implementation Phases

### Phase 1: Foundation (Week 1)
- [ ] Create new workspace structure
- [ ] Configure MCP servers (Context7 + Sequential Thinking)
- [ ] Create CLAUDE.md with personal instructions
- [ ] Set up scripts/ and projects/ directories

### Phase 2: PowerShell Commands (Week 1-2)
- [ ] Create /ps-script command with Context7 integration
- [ ] Create /ps-gui command
- [ ] Create /ps-graph command
- [ ] Create /ps-azure command
- [ ] Create PowerShell Builder Agent

### Phase 3: Azure Commands (Week 2)
- [ ] Create /webapp-deploy command
- [ ] Create /storage-setup command
- [ ] Create /github-workflow command
- [ ] Create Azure Deployer Agent

### Phase 4: Admin Commands (Week 2-3)
- [ ] Create /ad-admin, /entra-admin, /m365-admin commands
- [ ] Create /exchange-admin, /purview-admin commands
- [ ] Create Microsoft Graph Expert Agent
- [ ] Create AD Expert Agent
- [ ] Create Exchange Expert Agent

### Phase 5: Documentation (Week 3)
- [ ] Create powershell-patterns.md
- [ ] Create azure-deployment-guide.md
- [ ] Create microsoft-graph-examples.md
- [ ] Create ad-quickref.md
- [ ] Create workspace README.md

## What to Remove from Current Project

### Remove (Marketplace Infrastructure):
- [ ] All 58 plugin subdirectories (empty directories for public marketplace)
- [ ] `.claude-plugin/marketplace.json` (marketplace metadata)
- [ ] All `plugin.json` files (plugin distribution metadata)
- [ ] CONTRIBUTING.md (guidelines for external contributors)
- [ ] QUALITY_STANDARDS.md (quality tiers for public marketplace)
- [ ] Category directory structure (1-reasoning-foundation/, 2-active-directory/, etc.)

### Keep (Useful Content):
- [x] docs/REASONING_INTEGRATION.md (useful for complex decisions)
- [x] Sequential Thinking MCP patterns (for troubleshooting and design)
- [x] Claude Code best practices

## Success Criteria

Workspace is ready when:
- [ ] All 12 slash commands work and use Context7 for latest docs
- [ ] All 5 specialized agents respond with domain expertise
- [ ] MCP servers (Context7 + Sequential Thinking) configured and tested
- [ ] Can generate PowerShell script in < 2 minutes with latest SDK
- [ ] Can deploy Azure Static Web App in < 5 minutes
- [ ] Documentation provides quick reference for common tasks
- [ ] All generated scripts are production-ready with error handling

## Daily Workflows Enabled

1. **"I need a PowerShell script to..."**
   → `/ps-script "description"` → Working script in scripts/ directory

2. **"Create GUI tool for..."**
   → `/ps-gui "description"` → PowerShell script with Windows Forms GUI

3. **"Deploy my web app"**
   → `/webapp-deploy` → Deployed to Azure Static Web App with CI/CD

4. **"Bulk operation on AD/Azure/M365"**
   → `/ad-admin` or `/entra-admin` or `/m365-admin` → Safe bulk operation script

5. **"Latest Microsoft Graph API for..."**
   → `/ps-graph "description"` → Script using current Graph SDK

## Key Differences from Original Plan

| Aspect | Original Plan | Revised Plan |
|--------|--------------|--------------|
| **Purpose** | Public marketplace for AD Messaging Engineers | Personal productivity workspace |
| **Audience** | Many users | Single user (you) |
| **Structure** | 9 categories, 58 plugins | .claude/ with commands & agents |
| **Distribution** | GitHub marketplace with plugin.json | Project-level Claude Code config |
| **Quality System** | 3-tier public contribution standards | Just works for your needs |
| **MCP Focus** | Sequential Thinking only | Context7 (latest docs) + Sequential Thinking |
| **Scope** | Comprehensive marketplace for industry | Your specific workflows only |
| **Complexity** | High (public marketplace infrastructure) | Low (personal workspace) |

---

**Next Steps**:
1. Clean up marketplace infrastructure
2. Create .claude/ workspace structure
3. Implement PowerShell generation commands with Context7 integration
4. Create specialized agents
5. Add quick reference documentation
