# Personal IT Admin Workspace for Claude Code

A specialized Claude Code workspace for IT administrators focused on PowerShell automation, Azure deployment, and Microsoft 365 administration.

## Overview

This workspace enhances Claude Code with **SuperClaude Framework** + specialized commands, agents, and **8 MCP servers** to streamline:

- **PowerShell script generation** for Active Directory, Azure, Entra ID, M365, Exchange, and Microsoft Graph
- **GUI tool creation** using WPF/XAML for Windows administration with professional dark theme
- **Azure deployment** with Static Web Apps, Storage Accounts, and GitHub Actions
- **Admin operations** across AD, Entra ID, M365, Exchange, and Purview
- **Strategic analysis** with business expert panel mode
- **Systematic workflows** with 25 SuperClaude commands and 16 cognitive personas

**Key Features**:
- ✅ **SuperClaude Framework** - Meta-programming configuration layer with specialized development workflows
- ✅ **Context7 MCP** - Always fetch latest Microsoft documentation and API specifications
- ✅ **8 MCP Servers** - Enhanced capabilities for Azure, GitHub, Memory, and more
- ✅ **Professional Dark Theme** - Microsoft Fluent Design for all GUI scripts

## Quick Start

### Prerequisites

1. **Claude Code** installed ([installation guide](https://docs.claude.com/en/docs/claude-code))
2. **Python 3.8+** or **Node.js 16+** (for SuperClaude Framework installation)
3. **PowerShell** 7+ recommended
4. **Azure CLI** (for Azure operations)
5. **Git** (for GitHub workflow generation)

### Installation

1. **Clone or navigate to this workspace**:
   ```bash
   cd /path/to/Claude_Code_Marketplace
   ```

2. **Install SuperClaude Framework** (automatic):

   ```bash
   cd /path/to/Claude_Code_Marketplace && \
   if ! command -v pipx &> /dev/null; then \
       if command -v apt-get &> /dev/null; then \
           sudo apt-get update && sudo apt-get install -y pipx; \
       elif command -v brew &> /dev/null; then \
           brew install pipx; \
       else \
           python3 -m pip install --user pipx && python3 -m pipx ensurepath; \
       fi; \
   fi && \
   pipx install SuperClaude && SuperClaude install
   ```

   This automatically detects your OS, installs pipx if needed, then installs SuperClaude with 25 slash commands, 16 personas, and 7 behavioral modes.

3. **Install MCP servers** (automatic on first use):
   - Context7: `npx -y @context7/mcp-server`
   - Sequential Thinking: `npx -y @modelcontextprotocol/server-sequential-thinking`
   - Azure, GitHub, Memory, Filesystem, Git MCPs auto-install when needed

4. **Setup GitHub Token** (required for GitHub MCP):
   ```bash
   # Set environment variable
   export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_your_token_here"
   ```
   See `SETUP_MCP_SERVERS.md` for complete token setup instructions.

5. **Verify configuration**:
   ```bash
   # Check SuperClaude installation
   ls .claude/commands/sc-*.md  # Should show 25 commands

   # Check MCP configuration
   cat .claude/config.json

   # Restart Claude Code to load all components
   ```

### First Use

**IT Admin Commands**:
```bash
# Generate a PowerShell script
/ps-script "Create AD users from CSV with error logging"

# Generate a GUI tool with dark theme
/ps-gui "AD user search tool"

# Deploy a web app
/webapp-deploy "Deploy React app to Azure Static Web App"

# Run an admin operation
/ad-admin "Get all inactive users from last 90 days"
```

**SuperClaude Commands**:
```bash
# Intelligent implementation with auto persona selection
/sc:implement "PowerShell module for AD user lifecycle management"

# Comprehensive code analysis
/sc:analyze scripts/AD/ --focus security

# Generate documentation
/sc:document scripts/

# Strategic business analysis
/sc:business-panel "Analyze our IT automation strategy"

# Session management
/sc:save  # Save current work
/sc:load  # Resume previous session
```

## Slash Commands

### PowerShell Generation

#### `/ps-script "[description]"`
Generate PowerShell scripts with error handling, logging, and best practices.

**Examples**:
```bash
/ps-script "Bulk create AD users from CSV"
/ps-script "Export all M365 licenses to Excel"
/ps-script "Check Azure VM status across all subscriptions"
```

**Features**:
- Error handling with try-catch
- Parameter validation
- Verbose logging
- Module import checks
- Latest cmdlet versions via Context7

---

#### `/ps-gui "[description]"`
Generate PowerShell scripts with WPF/XAML GUI interfaces using professional dark theme.

**Examples**:
```bash
/ps-gui "AD user management tool with search and property editing"
/ps-gui "Azure VM dashboard showing status and metrics"
/ps-gui "Exchange mailbox size reporter"
```

**Features**:
- WPF/XAML for modern UI
- **Professional dark theme** (Microsoft Fluent Design)
- Complete dark theme reference in `docs/PowerShell-GUI-Dark-Theme-Reference.md`
- All controls styled (TextBox, Button, ComboBox, DataGrid, etc.)
- High contrast accessibility compliance
- Event handlers with error dialogs
- Input validation and progress indicators
- ReadOnly, Disabled, and Focus state styling

---

#### `/ps-graph "[description]"`
Generate Microsoft Graph PowerShell scripts with authentication and best practices.

**Examples**:
```bash
/ps-graph "Get all M365 groups and export members to CSV"
/ps-graph "Create Entra ID users from CSV with license assignment"
/ps-graph "Generate Teams usage report"
```

**Features**:
- Latest Microsoft.Graph SDK via Context7
- Proper authentication methods
- Required permission documentation
- Batch operations
- Pagination handling
- Throttling error handling

---

#### `/ps-azure "[description]"`
Generate Azure PowerShell scripts using Az modules.

**Examples**:
```bash
/ps-azure "List all VMs with cost estimates"
/ps-azure "Create storage account with lifecycle policy"
/ps-azure "Tag all resources in resource group"
```

**Features**:
- Latest Az modules via Context7
- Resource naming conventions
- Tagging support
- Cost documentation
- Error handling

### Web Development

#### `/webapp-deploy "[description]"`
Deploy web applications to Azure Static Web Apps with GitHub Actions.

**Examples**:
```bash
/webapp-deploy "Deploy React SPA to Azure"
/webapp-deploy "Setup static site with custom domain"
```

**Features**:
- Automatic GitHub Actions workflow generation
- Framework detection (React, Vue, Angular, etc.)
- Custom domain configuration
- Environment variables setup
- HTTPS by default

---

#### `/storage-setup "[description]"`
Configure Azure Storage Accounts with security and lifecycle policies.

**Examples**:
```bash
/storage-setup "Create blob storage for backups with auto-archival"
/storage-setup "Setup file share with access tiers"
```

**Features**:
- Blob containers with access control
- SAS token generation
- Lifecycle management policies
- CORS configuration
- Security hardening

---

#### `/github-workflow "[description]"`
Generate GitHub Actions workflows for CI/CD.

**Examples**:
```bash
/github-workflow "Deploy to Azure on push to main"
/github-workflow "Run tests and deploy to staging"
```

**Features**:
- Multi-environment support
- Azure integration
- Testing workflows
- Artifact management
- Secret management

### Admin Operations

#### `/ad-admin "[operation]"`
Active Directory administrative operations.

**Examples**:
```bash
/ad-admin "Create OU structure for new department"
/ad-admin "Get all users with expired passwords"
/ad-admin "Generate GPO report"
```

**Features**:
- User/group/computer management
- OU operations
- GPO management
- Health checks
- Replication monitoring

---

#### `/entra-admin "[operation]"`
Entra ID (Azure AD) operations via Microsoft Graph.

**Examples**:
```bash
/entra-admin "Bulk create users from CSV"
/entra-admin "Configure conditional access policy"
/entra-admin "Export MFA status report"
```

**Features**:
- User lifecycle management
- Group management (dynamic/assigned)
- Conditional access
- MFA configuration
- License management

---

#### `/m365-admin "[operation]"`
Microsoft 365 administration (Teams, SharePoint, OneDrive).

**Examples**:
```bash
/m365-admin "Create Teams with standard channels"
/m365-admin "Audit SharePoint permissions"
/m365-admin "Get OneDrive usage report"
```

**Features**:
- Teams provisioning
- SharePoint site management
- OneDrive administration
- License optimization
- Usage reporting

---

#### `/exchange-admin "[operation]"`
Exchange Server and Exchange Online management.

**Examples**:
```bash
/exchange-admin "Create shared mailbox with permissions"
/exchange-admin "Configure mail flow rule"
/exchange-admin "Generate mailbox size report"
```

**Features**:
- Mailbox management
- Mail flow configuration
- Transport rules
- Migration operations
- Compliance features

---

#### `/purview-admin "[operation]"`
Microsoft Purview compliance and governance.

**Examples**:
```bash
/purview-admin "Create retention policy for Teams"
/purview-admin "Configure DLP policy for PCI data"
/purview-admin "Run eDiscovery search"
```

**Features**:
- Retention policies
- DLP policies
- Sensitivity labels
- eDiscovery
- Audit log search

---

## SuperClaude Framework Commands

SuperClaude Framework provides 25 specialized `/sc:` commands with intelligent persona activation and systematic workflows.

### Implementation & Development

#### `/sc:implement "[description]"`
Intelligent feature implementation with automatic persona selection.

**Examples**:
```bash
/sc:implement "PowerShell module for AD user lifecycle management"
/sc:implement "Azure deployment automation framework"
```

**Features**:
- Auto-selects appropriate personas (Architect, Builder, etc.)
- Context7 integration for latest documentation
- Systematic workflow with validation gates
- Cross-session memory for complex projects

---

#### `/sc:design "[description]"`
System architecture and API design with comprehensive specifications.

**Examples**:
```bash
/sc:design "Modular PowerShell automation framework"
/sc:design "Azure Static Web App with Functions backend"
```

---

#### `/sc:build "[description]"`
Build, compile, and package projects with error handling.

**Examples**:
```bash
/sc:build "PowerShell module with manifest and documentation"
```

---

#### `/sc:test "[description]"`
Execute tests with coverage analysis and quality reporting.

**Examples**:
```bash
/sc:test scripts/AD/
/sc:test "Run Pester tests with coverage report"
```

---

### Analysis & Quality

#### `/sc:analyze "[path]"`
Comprehensive multi-domain code analysis.

**Examples**:
```bash
/sc:analyze scripts/AD/ --focus security
/sc:analyze --think-hard scripts/
```

**Analysis Domains**:
- Quality (code smells, maintainability)
- Security (vulnerabilities, best practices)
- Performance (bottlenecks, optimization)
- Architecture (design patterns, modularity)

---

#### `/sc:improve "[path or description]"`
Systematic code quality and performance improvements.

**Examples**:
```bash
/sc:improve scripts/AD/User-Provisioning.ps1
/sc:improve "Refactor for better error handling"
```

---

#### `/sc:troubleshoot "[issue description]"`
Systematic issue diagnosis and resolution.

**Examples**:
```bash
/sc:troubleshoot "Azure deployment failing with auth error"
/sc:troubleshoot "PowerShell script intermittent failures"
```

---

#### `/sc:cleanup "[path]"`
Code cleanup, dead code removal, and project organization.

**Examples**:
```bash
/sc:cleanup scripts/
/sc:cleanup "Remove unused functions and optimize imports"
```

---

### Documentation & Planning

#### `/sc:document "[path or description]"`
Generate focused documentation for components and APIs.

**Examples**:
```bash
/sc:document scripts/AD/
/sc:document "Create user guide for AD management tools"
```

---

#### `/sc:explain "[topic or code]"`
Clear explanations with educational focus.

**Examples**:
```bash
/sc:explain "How does Microsoft Graph batching work?"
/sc:explain scripts/Complex-Automation.ps1
```

---

#### `/sc:estimate "[task description]"`
Development time estimates with intelligent analysis.

**Examples**:
```bash
/sc:estimate "Implement AD user provisioning automation"
```

---

#### `/sc:brainstorm "[topic]"`
Interactive requirements discovery through Socratic dialogue.

**Examples**:
```bash
/sc:brainstorm "Automate user onboarding process"
```

---

### Strategic Analysis

#### `/sc:business-panel "[topic or @document]"`
Multi-expert strategic analysis with 9 business thought leaders.

**Examples**:
```bash
/sc:business-panel "Analyze our IT automation strategy"
/sc:business-panel @automation_roadmap.md
```

**Expert Panel**:
- **Clayton Christensen** - Innovation and disruption
- **Michael Porter** - Competitive strategy
- **Peter Drucker** - Management effectiveness
- **Seth Godin** - Change management
- **Jim Collins** - Organizational excellence
- **Nassim Taleb** - Risk and antifragility
- **Donella Meadows** - Systems thinking
- **Jean-luc Doumont** - Communication clarity

**Modes**:
- `--mode discussion` - Collaborative analysis (default)
- `--mode debate` - Adversarial challenge mode
- `--mode socratic` - Question-driven exploration

---

### Workflow & Integration

#### `/sc:git "[operation]"`
Intelligent git operations with smart commit messages.

**Examples**:
```bash
/sc:git "Commit all AD automation scripts"
/sc:git "Create feature branch for Azure deployment"
```

---

#### `/sc:workflow "@prd or description"`
Generate implementation workflows from PRDs.

**Examples**:
```bash
/sc:workflow @automation_platform_prd.md
```

---

#### `/sc:task "[complex task]"`
Complex task orchestration with intelligent delegation.

**Examples**:
```bash
/sc:task "Modernize all PowerShell scripts to latest patterns"
```

---

### Session Management

#### `/sc:save`
Save current session state and project context.

**Usage**:
```bash
/sc:save
```

Saves:
- Current work progress
- Active tasks and todos
- Project context and decisions
- Tool selections and patterns

---

#### `/sc:load`
Resume previous session with full context restoration.

**Usage**:
```bash
/sc:load
```

Restores:
- Session state and progress
- Task list and priorities
- Project context
- Previous work patterns

---

#### `/sc:reflect "[topic]"`
Task validation and quality assessment.

**Examples**:
```bash
/sc:reflect "User provisioning automation project"
```

---

### Additional Commands

- **`/sc:spec-panel`** - Multi-expert specification review
- **`/sc:index`** - Generate project documentation and knowledge base
- **`/sc:spawn`** - Meta-system task breakdown and delegation
- **`/sc:select-tool`** - Intelligent MCP tool selection

**See**: `docs/superclaude-integration.md` for complete SuperClaude documentation

---

## Specialized Agents

Invoke agents with `@agent-name "[task]"` for expert assistance.

### `@powershell-builder`
**Expert in**: PowerShell development, XAML GUIs, Microsoft modules, error handling

**Use for**:
- Complex script architecture
- Performance optimization
- Advanced error handling
- Module integration
- GUI design

**Example**:
```bash
@powershell-builder "Design a modular AD user provisioning system with validation"
```

---

### `@azure-deployer`
**Expert in**: Azure deployment, Static Web Apps, GitHub Actions, cost optimization

**Use for**:
- Azure architecture design
- Deployment strategy
- CI/CD pipeline optimization
- Cost analysis
- Resource naming and tagging

**Example**:
```bash
@azure-deployer "Plan a multi-environment deployment strategy for static web app"
```

---

### `@microsoft-graph-expert`
**Expert in**: Microsoft Graph API, authentication, batch operations, permissions

**Use for**:
- Graph API architecture
- Authentication methods
- Permission optimization
- Batch operation design
- Throttling handling

**Example**:
```bash
@microsoft-graph-expert "Design efficient approach for syncing 10k users to external system"
```

---

### `@ad-expert`
**Expert in**: Active Directory, GPO, replication, trust relationships, FSMO roles

**Use for**:
- AD architecture design
- GPO troubleshooting
- Replication issues
- Trust configuration
- Health monitoring

**Example**:
```bash
@ad-expert "Troubleshoot replication failure between domain controllers"
```

---

### `@exchange-expert`
**Expert in**: Exchange Server, Exchange Online, mail flow, hybrid deployment

**Use for**:
- Mail flow troubleshooting
- Hybrid configuration
- Migration planning
- Compliance setup
- Performance tuning

**Example**:
```bash
@exchange-expert "Plan Exchange hybrid deployment with minimal downtime"
```

## MCP Servers

This workspace includes **8 MCP servers** providing enhanced capabilities:

⚠️ **Setup Required**: GitHub MCP requires a personal access token. See `SETUP_MCP_SERVERS.md` for complete setup instructions.

### 1. Context7 ✅
**Purpose**: Fetch latest Microsoft documentation and SDK references

**Auto-activated for**: All PowerShell generation, Azure operations, Microsoft Graph scripts

**Provides**: Latest cmdlet documentation, API specifications, best practices, code examples

---

### 2. Sequential Thinking ✅
**Purpose**: Structured reasoning for complex troubleshooting and architecture decisions

**Use with**: `--think` flag for complex analysis, architecture design, multi-step troubleshooting

---

### 3. Azure MCP ✅
**Purpose**: Native Azure service integration

**Capabilities**:
- Direct Azure CLI operations
- File storage (blob, files) management
- Database and logs querying
- Azure resource operations

**Enhances**: `/ps-azure`, `/webapp-deploy`, `/storage-setup` commands

---

### 4. Microsoft Learn MCP ✅
**Purpose**: Real-time Microsoft Learn documentation

**Capabilities**:
- Official Microsoft tutorials
- Conceptual documentation
- Code samples from Microsoft Learn
- Latest best practices

**Complements**: Context7 (Context7 = API/SDK, MS Learn = tutorials/concepts)

---

### 5. GitHub MCP ⚠️
**Purpose**: GitHub Actions, PR, and issue management

**Capabilities**:
- GitHub Actions workflow management
- Create/manage pull requests and issues
- Repository operations
- GitHub automation

**Enhances**: `/github-workflow` command

**⚠️ Requires**: GitHub Personal Access Token (see `SETUP_MCP_SERVERS.md`)

---

### 6. Memory MCP ✅
**Purpose**: Persistent knowledge graph across sessions

**Capabilities**:
- Remember script patterns and preferences
- Track common operations
- Learn from user interactions
- Build workspace knowledge graph

**Usage**: "Remember that I prefer..." statements

---

### 7. Filesystem MCP ✅
**Purpose**: Secure file operations for workspace management

**Capabilities**:
- Bulk file operations
- Script organization
- Directory management
- Secure file access (limited to `scripts/`, `projects/`, `docs/`)

---

### 8. Git MCP ✅
**Purpose**: Git repository operations and version control

**Capabilities**:
- Git status, diff, log
- Commit operations
- Branch management
- Repository history

**Usage**: "Show git status", "Commit all scripts", "Create feature branch"

---

### Complete Setup

See **`SETUP_MCP_SERVERS.md`** for:
- GitHub token setup instructions
- Verification tests for each MCP server
- Troubleshooting guide
- Performance notes

See **`docs/recommended-mcp-servers.md`** for:
- Detailed analysis of each MCP server
- Why each server was selected
- Complete configuration reference

## Directory Structure

```
Claude_Code_Marketplace/
├── .claude/
│   ├── config.json              # MCP server configuration
│   ├── CLAUDE.md                # Workspace behavior instructions
│   ├── commands/                # Slash command definitions
│   │   ├── ps-script.md         # IT Admin commands
│   │   ├── ps-gui.md
│   │   ├── ps-graph.md
│   │   ├── ps-azure.md
│   │   ├── webapp-deploy.md
│   │   ├── storage-setup.md
│   │   ├── github-workflow.md
│   │   ├── ad-admin.md
│   │   ├── entra-admin.md
│   │   ├── m365-admin.md
│   │   ├── exchange-admin.md
│   │   ├── purview-admin.md
│   │   └── sc-*.md              # 25 SuperClaude commands
│   ├── agents/                  # Specialized agent definitions
│   │   ├── powershell-builder.md
│   │   ├── azure-deployer.md
│   │   ├── microsoft-graph-expert.md
│   │   ├── ad-expert.md
│   │   ├── exchange-expert.md
│   │   └── [16 SuperClaude personas]
│   ├── modes/                   # SuperClaude behavioral modes
│   │   ├── MODE_Brainstorming.md
│   │   ├── MODE_Introspection.md
│   │   ├── MODE_Orchestration.md
│   │   └── [7 behavioral modes]
│   └── business/                # Business expert panel
│       └── [9 thought leader personas]
├── docs/                        # Quick reference documentation
│   ├── PowerShell-GUI-Dark-Theme-Reference.md
│   ├── powershell-patterns.md
│   ├── azure-deployment-guide.md
│   ├── microsoft-graph-examples.md
│   ├── ad-quickref.md
│   ├── recommended-mcp-servers.md
│   └── superclaude-integration.md
├── scripts/                     # Generated scripts organized by category
│   ├── AD/
│   ├── Azure/
│   ├── Entra/
│   ├── M365/
│   ├── Exchange/
│   ├── Graph/
│   └── Purview/
├── projects/                    # Web application projects
├── SETUP_MCP_SERVERS.md         # Complete setup instructions
└── README.md                    # This file
```

## Quick Reference Documentation

Located in `docs/` directory for fast reference:

- **`PowerShell-GUI-Dark-Theme-Reference.md`**: **REQUIRED** comprehensive dark theme for all GUI scripts (Microsoft Fluent Design)
- **`superclaude-integration.md`**: Complete SuperClaude Framework guide with all 25 commands, personas, and usage examples
- **`powershell-patterns.md`**: Common PowerShell patterns, templates, error handling, logging, parallel processing
- **`azure-deployment-guide.md`**: Azure CLI commands, Static Web Apps, Storage Accounts, cost optimization
- **`microsoft-graph-examples.md`**: Authentication methods, user/group/Teams operations, permissions, batch operations
- **`ad-quickref.md`**: Active Directory cmdlets, filters, bulk operations, GPO management, replication
- **`recommended-mcp-servers.md`**: MCP server analysis, recommendations, and setup guide

**Setup Instructions**:
- **`SETUP_MCP_SERVERS.md`**: Complete setup instructions for SuperClaude Framework + 8 MCP servers

## Usage Examples

### Example 1: Create AD User Management Tool

```bash
# Generate a GUI tool for AD user management
/ps-gui "AD user management tool with search, create, edit, and disable capabilities"

# Result: PowerShell script with WPF/XAML GUI saved to scripts/AD/
# - Search users by name, department, or username
# - View user properties in detail panel
# - Edit user attributes
# - Enable/disable accounts
# - Reset passwords
```

### Example 2: Deploy React App to Azure

```bash
# Deploy a React application
/webapp-deploy "Deploy my React app from GitHub to Azure Static Web App"

# Result:
# - Azure Static Web App created
# - GitHub Actions workflow generated (.github/workflows/azure-static-web-apps.yml)
# - Automatic build and deployment configured
# - HTTPS endpoint provided
# - Custom domain instructions included
```

### Example 3: Microsoft Graph Report

```bash
# Generate M365 license report
/ps-graph "Export all M365 users with their assigned licenses to Excel"

# Result: PowerShell script saved to scripts/Graph/
# - Connects to Microsoft Graph with proper scopes
# - Fetches all users with license details
# - Exports to Excel with formatting
# - Includes license SKU mapping
# - Documents required permissions
```

### Example 4: Exchange Mailbox Report

```bash
# Generate mailbox size report
/exchange-admin "Generate report of all mailboxes over 45GB with growth trend"

# Result: PowerShell script saved to scripts/Exchange/
# - Connects to Exchange Online
# - Gets mailbox statistics
# - Filters by size
# - Calculates growth trend
# - Exports to CSV with charts
```

## Best Practices

### PowerShell Scripts
- Always review generated scripts before running in production
- Test in development environment first
- Ensure required modules are installed
- Verify permissions before execution
- Review credential handling approach

### Azure Deployment
- Review resource naming conventions
- Verify cost estimates
- Configure monitoring and alerts
- Set up proper tagging
- Document disaster recovery approach

### Microsoft Graph
- Use least privilege permissions
- Implement throttling handling for large operations
- Use batch operations for efficiency
- Document required API permissions
- Test authentication methods

### Security
- Never commit credentials to version control
- Use Azure Key Vault for secrets
- Implement least privilege access
- Review security best practices in `.claude/CLAUDE.md`
- Enable audit logging for admin operations

## Troubleshooting

### MCP Servers Not Loading

**Issue**: Commands fail with MCP errors

**Solution**:
```bash
# Verify MCP configuration
cat .claude/config.json

# Test MCP servers manually
npx -y @context7/mcp-server
npx -y @modelcontextprotocol/server-sequential-thinking

# Restart Claude Code
```

### PowerShell Module Not Found

**Issue**: Generated script fails with "Module not found"

**Solution**:
```powershell
# Install required modules
Install-Module ActiveDirectory -Scope CurrentUser
Install-Module Az -Scope CurrentUser
Install-Module Microsoft.Graph -Scope CurrentUser
Install-Module ExchangeOnlineManagement -Scope CurrentUser

# Update existing modules
Update-Module Az
Update-Module Microsoft.Graph
```

### Azure CLI Not Authenticated

**Issue**: Azure commands fail with authentication error

**Solution**:
```bash
# Login to Azure
az login

# Verify subscription
az account show

# Set default subscription
az account set --subscription "Your Subscription Name"
```

### GitHub Actions Workflow Fails

**Issue**: Deployment workflow fails to run

**Solution**:
1. Verify `AZURE_STATIC_WEB_APPS_API_TOKEN` secret is set in GitHub repository
2. Check workflow file syntax in `.github/workflows/`
3. Review workflow run logs in GitHub Actions tab
4. Ensure Azure Static Web App exists and is accessible

## Advanced Usage

### Professional Dark Theme for XAML GUIs

All GUI scripts generated with `/ps-gui` automatically include a comprehensive professional dark theme.

**Theme Reference**: See `docs/PowerShell-GUI-Dark-Theme-Reference.md` for:
- Complete color palette (#1E1E1E background, #0078D4 accent)
- All control styles (70+ controls)
- Microsoft Fluent Design principles
- High contrast accessibility compliance
- ReadOnly, Disabled, and Focus states

**Key Features**:
- **Primary Background**: #1E1E1E (professional dark appearance)
- **Control Background**: #2D2D2D (TextBox, ComboBox, DataGrid)
- **Accent Blue**: #0078D4 (Microsoft's official blue)
- **Text Color**: #FFFFFF (high contrast on dark background)
- **Hover States**: #106EBE (interactive feedback)
- **Focus Indicators**: Blue borders for accessibility
- **ReadOnly Styling**: Distinct #1A1A1A background
- **Disabled Styling**: #666666 text color

**All controls styled**:
TextBox, Button, ComboBox, DataGrid, ListView, ListBox, CheckBox, RadioButton, ProgressBar, PasswordBox, TabControl, TreeView, Menu, MenuItem, ContextMenu, ToolTip, GroupBox, Label, ScrollBar, and more.

The theme is embedded directly in generated GUI scripts, ensuring consistent professional appearance across all tools.

### Combining Commands with Agents

For complex tasks, combine commands with specialized agents:

```bash
# Step 1: Get expert advice
@azure-deployer "Review architecture for high-traffic static web app with API backend"

# Step 2: Implement based on recommendations
/webapp-deploy "Deploy React app with Azure Functions backend"

# Step 3: Add monitoring
/ps-azure "Setup Application Insights and alerts for static web app"
```

### Using Sequential Thinking for Complex Decisions

For complex troubleshooting or architecture decisions:

```bash
# Invoke with --think flag
/ps-script "Design modular user provisioning system" --think

# Claude will use Sequential Thinking MCP to:
# 1. Break down the problem
# 2. Analyze architecture options
# 3. Evaluate trade-offs
# 4. Recommend best approach
# 5. Generate optimized code
```

## Contributing to This Workspace

This is a personal workspace, but you can customize it for your needs:

1. **Add new commands**: Create `.md` files in `.claude/commands/`
2. **Add new agents**: Create `.md` files in `.claude/agents/`
3. **Customize behavior**: Edit `.claude/CLAUDE.md`
4. **Add MCP servers**: Update `.claude/config.json`

## Resources

### Documentation
- [Claude Code Documentation](https://docs.claude.com/en/docs/claude-code)
- [SuperClaude Documentation](https://superclaude.netlify.app/docs/) - Official SuperClaude docs
- [SuperClaude Framework GitHub](https://github.com/SuperClaude-Org/SuperClaude_Framework)
- [Model Context Protocol (MCP)](https://modelcontextprotocol.io/)
- [Context7 MCP Server](https://github.com/context7/mcp-server)
- [Microsoft Graph Documentation](https://learn.microsoft.com/en-us/graph/)
- [Azure Static Web Apps](https://learn.microsoft.com/en-us/azure/static-web-apps/)

### Quick References (in `docs/`)
- **PowerShell GUI Dark Theme Reference** - Comprehensive dark theme for all GUI scripts
- **SuperClaude Integration Guide** - Complete framework documentation with 25 commands
- PowerShell Patterns - Common patterns and best practices
- Azure Deployment Guide - Azure CLI and deployment workflows
- Microsoft Graph Examples - Graph API authentication and operations
- Active Directory Quick Reference - AD cmdlets and operations
- Recommended MCP Servers - MCP server analysis and setup

### Microsoft PowerShell Modules
- [ActiveDirectory](https://learn.microsoft.com/en-us/powershell/module/activedirectory/)
- [Az](https://learn.microsoft.com/en-us/powershell/azure/new-azureps-module-az)
- [Microsoft.Graph](https://learn.microsoft.com/en-us/powershell/microsoftgraph/)
- [ExchangeOnlineManagement](https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell)

## Support

For issues or questions:

1. Check `.claude/CLAUDE.md` for workspace behavior documentation
2. Review quick reference docs in `docs/`
3. Consult command definitions in `.claude/commands/`
4. Review agent capabilities in `.claude/agents/`
5. Check `REVISED_PLAN.md` for complete workspace architecture

## License

Personal workspace - customize and use as needed.

---

**Version**: 2.0
**Last Updated**: 2025-10-12
**Components**: SuperClaude Framework + 8 MCP Servers + IT Admin Commands
**Workspace Type**: Personal IT Admin Productivity
**Target Audience**: IT Administrators, PowerShell Developers, Azure Engineers

**What's New in v2.0**:
- ✅ SuperClaude Framework integration with 25 specialized commands
- ✅ 16 cognitive AI personas with auto-activation
- ✅ Business expert panel mode with 9 thought leaders
- ✅ 8 MCP servers (Azure, GitHub, Memory, Filesystem, Git, MS Learn, Context7, Sequential)
- ✅ Professional dark theme for all GUI scripts
- ✅ Session management with /sc:save and /sc:load
- ✅ Systematic workflows and token-efficient communication
