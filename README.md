# 🚀 IT Admin Workspace for Claude Code

<div align="center">

**Your AI-Powered Command Center for IT Administration**

[![Claude Code](https://img.shields.io/badge/Claude-Code-5A67D8?style=for-the-badge&logo=anthropic)](https://claude.com/claude-code)
[![SuperClaude](https://img.shields.io/badge/SuperClaude-Framework-00D9FF?style=for-the-badge)](https://superclaude.netlify.app/docs/)
[![PowerShell](https://img.shields.io/badge/PowerShell-7+-5391FE?style=for-the-badge&logo=powershell)](https://github.com/PowerShell/PowerShell)
[![Azure](https://img.shields.io/badge/Azure-Ready-0078D4?style=for-the-badge&logo=microsoft-azure)](https://azure.microsoft.com/)

*Automate everything with AI-powered script generation, intelligent workflows, and 8 MCP servers*

[🔧 Add to Claude Code](#-add-this-workspace-to-claude-code) • [🎯 How to Use](#-how-to-use-it) • [📚 Commands](#-command-categories) • [🤖 Agents](#-specialized-ai-agents) • [⚡ Setup](#-installation)

</div>

---

## ✨ What Is This?

A **complete AI-powered workspace** that transforms Claude Code into your personal IT automation assistant. Generate PowerShell scripts, deploy Azure infrastructure, manage Microsoft 365, and analyze IT strategy—all through simple commands.

### 🎁 What You Get

| Feature | Description |
|---------|-------------|
| **🎯 38+ Commands** | 13 IT admin commands + 25 SuperClaude workflow commands |
| **🤖 30 AI Agents** | 5 IT experts + 16 cognitive personas + 9 business strategists |
| **⚡ 8 MCP Servers** | Context7, Sequential Thinking, Azure, GitHub, Memory, and more |
| **🎨 Dark Theme** | Professional Microsoft Fluent Design for all GUI tools |
| **📚 Documentation** | 11+ quick reference guides for PowerShell, Azure, Graph API |
| **💾 Session Memory** | Save and resume work with full context preservation |

---

## 🔧 Add This Workspace to Claude Code

> **Get this workspace running in 2 minutes!** 🚀

### ⚡ Automatic Global Installation (Recommended)

**One command to install everything globally** - Use commands from **any directory**:

```bash
# Clone and run the installer
git clone https://github.com/durgesh0505/AD-Msg-Cladue-Workspace.git && \
cd AD-Msg-Cladue-Workspace && \
./install.sh
```

**What the installer does**:
- ✅ Installs SuperClaude Framework (25 commands, 16 personas)
- ✅ Installs IT Admin commands globally (13 commands)
- ✅ Installs IT Admin agents globally (5 agents)
- ✅ Configures 8 MCP servers
- ✅ Copies documentation to `~/IT-Admin-Workspace-Docs/`
- ✅ Makes everything available from **any directory** 🌍

**After installation**: Open Claude Code in **any folder** and use all commands!

---

### 📦 Manual Installation (Workspace-Specific)

If you only want to use this in a specific directory:

```bash
# Clone the repository
git clone https://github.com/durgesh0505/AD-Msg-Cladue-Workspace.git

# Navigate to the workspace
cd AD-Msg-Cladue-Workspace

# Open in Claude Code (commands only work in this directory)
claude-code .
```

---

### ✅ Verify Installation

Once opened in Claude Code, verify everything works:

```bash
# Test 1: Check if commands are available
# Try typing "/" in Claude Code - you should see all commands

# Test 2: Test a simple command
/ps-script "Get current date and time"

# Test 3: Check MCP servers (if installed)
# Commands will automatically use Context7 for documentation
```

**You should see**:
- ✅ 38+ slash commands available (type `/` to see them)
- ✅ 30 AI agents ready (type `@` to see them)
- ✅ Commands generate production-ready code
- ✅ Professional dark theme for GUI scripts

---

### 🎯 Next Steps

After adding the workspace:

1. **📖 Read**: [SETUP_MCP_SERVERS.md](SETUP_MCP_SERVERS.md) - Install SuperClaude Framework + MCP servers
2. **🎓 Try**: Your first command (see below)
3. **📚 Explore**: Browse `docs/` for quick reference guides

---

## 🎯 How to Use It

> **New to this workspace? Start here!** 👇

### 🏃 In 30 Seconds

1. **Open Claude Code** in this directory
2. **Type a command** like `/ps-gui "AD user search tool"`
3. **Get production-ready code** instantly with error handling, logging, and professional UI

### 💡 Common Tasks

<table>
<tr>
<td width="50%">

#### 📝 Generate PowerShell Scripts

```bash
/ps-script "Export inactive AD users to CSV"
```
→ Gets latest AD cmdlets and creates production-ready script

</td>
<td width="50%">

#### 🎨 Create GUI Tools

```bash
/ps-gui "AD user management dashboard"
```
→ Beautiful dark-themed WPF/XAML interface

</td>
</tr>
<tr>
<td>

#### ☁️ Deploy to Azure

```bash
/webapp-deploy "Deploy my React app"
```
→ Complete Azure + GitHub Actions setup

</td>
<td>

#### 📊 Microsoft 365 Operations

```bash
/ps-graph "Export all M365 licenses"
```
→ Latest Graph API with authentication

</td>
</tr>
<tr>
<td>

#### 🔍 Analyze Code

```bash
/sc:analyze scripts/ --focus security
```
→ Multi-domain analysis with recommendations

</td>
<td>

#### 🧠 Strategic Planning

```bash
/sc:business-panel "IT automation strategy"
```
→ 9 business experts analyze your plans

</td>
</tr>
</table>

### 🎓 Your First Command

Try this to see the power:

```bash
/ps-gui "Create an AD user search tool with filters for department and status"
```

**You'll get**: A complete PowerShell script with professional dark theme GUI, search functionality, data grids, and error handling—ready to run!

---

## ⚡ Installation

### 📋 Prerequisites

- ✅ **Claude Code** ([installation guide](https://docs.claude.com/en/docs/claude-code))
- ✅ **Python 3.8+** or **Node.js 16+**
- ✅ **PowerShell 7+** (recommended)
- ✅ **Azure CLI** (for Azure operations)
- ✅ **Git** (for version control)

### 🚀 One-Command Setup

**Linux/macOS/WSL:**

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

This automatically:
- 🔍 Detects your operating system
- 📦 Installs pipx if needed
- ⚡ Installs SuperClaude Framework
- ✨ Configures 25 commands, 16 personas, 7 behavioral modes

### 🔑 GitHub Token (Optional)

For GitHub automation, set your token:

```bash
export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_your_token_here"
```

See **[SETUP_MCP_SERVERS.md](SETUP_MCP_SERVERS.md)** for complete setup instructions.

---

## 📚 Command Categories

### 🔧 PowerShell Generation

| Command | What It Does | Example |
|---------|--------------|---------|
| **`/ps-script`** | Generate PowerShell scripts | `/ps-script "Bulk create AD users"` |
| **`/ps-gui`** | Create GUI tools with dark theme | `/ps-gui "Exchange mailbox reporter"` |
| **`/ps-graph`** | Microsoft Graph operations | `/ps-graph "Export Teams channels"` |
| **`/ps-azure`** | Azure PowerShell scripts | `/ps-azure "Tag all VMs by environment"` |

### ☁️ Azure & Web Deployment

| Command | What It Does | Example |
|---------|--------------|---------|
| **`/webapp-deploy`** | Deploy to Azure Static Web Apps | `/webapp-deploy "Deploy React app"` |
| **`/storage-setup`** | Configure Azure Storage | `/storage-setup "Blob storage for backups"` |
| **`/github-workflow`** | Create CI/CD workflows | `/github-workflow "Deploy on push to main"` |

### 👥 Admin Operations

| Command | What It Does | Example |
|---------|--------------|---------|
| **`/ad-admin`** | Active Directory tasks | `/ad-admin "Get inactive users"` |
| **`/entra-admin`** | Entra ID (Azure AD) | `/entra-admin "Bulk create users"` |
| **`/m365-admin`** | Microsoft 365 | `/m365-admin "Create Teams"` |
| **`/exchange-admin`** | Exchange Online | `/exchange-admin "Mailbox report"` |
| **`/purview-admin`** | Compliance & governance | `/purview-admin "DLP policy"` |

### 🧠 SuperClaude Workflows

<details>
<summary><b>25 Intelligent Commands</b> - Click to expand</summary>

#### 🛠️ Implementation & Development

| Command | Purpose |
|---------|---------|
| **`/sc:implement`** | Feature implementation with auto persona selection |
| **`/sc:design`** | System architecture and API design |
| **`/sc:build`** | Build, compile, and package projects |
| **`/sc:test`** | Execute tests with coverage analysis |

#### 🔍 Analysis & Quality

| Command | Purpose |
|---------|---------|
| **`/sc:analyze`** | Multi-domain code analysis (quality, security, performance) |
| **`/sc:improve`** | Systematic code improvements |
| **`/sc:troubleshoot`** | Issue diagnosis and resolution |
| **`/sc:cleanup`** | Dead code removal and optimization |

#### 📖 Documentation & Planning

| Command | Purpose |
|---------|---------|
| **`/sc:document`** | Generate focused documentation |
| **`/sc:explain`** | Clear explanations with examples |
| **`/sc:estimate`** | Development time estimates |
| **`/sc:brainstorm`** | Requirements discovery dialogue |
| **`/sc:spec-panel`** | Multi-expert specification review |

#### 🎯 Strategic Analysis

| Command | Purpose |
|---------|---------|
| **`/sc:business-panel`** | 9 business experts analyze your strategy |

#### 🔄 Workflow & Integration

| Command | Purpose |
|---------|---------|
| **`/sc:git`** | Intelligent git operations |
| **`/sc:workflow`** | Generate implementation workflows |
| **`/sc:task`** | Complex task orchestration |

#### 💾 Session Management

| Command | Purpose |
|---------|---------|
| **`/sc:save`** | Save session state and context |
| **`/sc:load`** | Resume previous session |
| **`/sc:reflect`** | Task validation and review |

</details>

---

## 🤖 Specialized AI Agents

Invoke with **`@agent-name`** for expert assistance:

| Agent | Expertise | Example Usage |
|-------|-----------|---------------|
| **`@powershell-builder`** | 🔹 PowerShell, XAML GUIs, modules | `@powershell-builder "Design modular AD system"` |
| **`@azure-deployer`** | ☁️ Azure architecture, CI/CD, costs | `@azure-deployer "Multi-region deployment strategy"` |
| **`@microsoft-graph-expert`** | 📊 Graph API, auth, batching | `@microsoft-graph-expert "Sync 10k users efficiently"` |
| **`@ad-expert`** | 👥 Active Directory, GPO, replication | `@ad-expert "Troubleshoot replication issues"` |
| **`@exchange-expert`** | 📧 Exchange, mail flow, hybrid | `@exchange-expert "Plan hybrid deployment"` |

**Plus 16 SuperClaude Personas**: Analyzer, Architect, Builder, Debugger, Optimizer, Guardian, Documenter, Mentor, and more—auto-activate based on your task!

---

## 🎨 Professional Dark Theme

All GUI scripts use **Microsoft Fluent Design** with professional dark theme:

<table>
<tr>
<td>

**🎨 Color Palette**
- Background: `#1E1E1E`
- Controls: `#2D2D2D`
- Accent: `#0078D4`
- Text: `#FFFFFF`

</td>
<td>

**✨ Features**
- 70+ styled controls
- High contrast accessibility
- ReadOnly/Disabled states
- Focus indicators
- Hover effects

</td>
</tr>
</table>

**Complete guide**: [docs/PowerShell-GUI-Dark-Theme-Reference.md](docs/PowerShell-GUI-Dark-Theme-Reference.md)

---

## ⚡ MCP Servers

**8 powerful servers** enhance your workspace:

| Server | Status | Purpose | Key Features |
|--------|--------|---------|--------------|
| **Context7** | ✅ | Latest Microsoft docs | API specs, cmdlets, best practices |
| **Sequential Thinking** | ✅ | Complex reasoning | Multi-step analysis, troubleshooting |
| **Azure MCP** | ✅ | Azure integration | CLI operations, storage, databases |
| **MS Learn MCP** | ✅ | Official tutorials | Conceptual docs, code samples |
| **GitHub MCP** | ⚠️ | GitHub automation | Actions, PRs, issues, workflows |
| **Memory MCP** | ✅ | Persistent learning | Cross-session knowledge graph |
| **Filesystem MCP** | ✅ | File operations | Secure bulk operations |
| **Git MCP** | ✅ | Version control | Status, commits, branches |

⚠️ **Note**: GitHub MCP requires a personal access token. See [SETUP_MCP_SERVERS.md](SETUP_MCP_SERVERS.md) for setup.

---

## 💼 Real-World Examples

### Example 1: 🎨 AD User Management Tool

```bash
/ps-gui "AD user management tool with search, create, edit, and disable"
```

**You get**:
- ✅ Professional dark theme WPF/XAML interface
- ✅ Search users by name/department/username
- ✅ View detailed user properties
- ✅ Edit attributes and reset passwords
- ✅ Enable/disable accounts
- ✅ Complete error handling

**Saved to**: `scripts/AD/AD-User-Management-Tool.ps1`

---

### Example 2: ☁️ Deploy React App

```bash
/webapp-deploy "Deploy my React app to Azure"
```

**You get**:
- ✅ Azure Static Web App created
- ✅ GitHub Actions workflow (`.github/workflows/azure-static-web-apps.yml`)
- ✅ Automatic build and deployment
- ✅ HTTPS endpoint
- ✅ Custom domain instructions

---

### Example 3: 📊 M365 License Report

```bash
/ps-graph "Export all M365 users with licenses to Excel"
```

**You get**:
- ✅ Latest Microsoft.Graph cmdlets
- ✅ Proper authentication with scopes
- ✅ Fetch all users with license details
- ✅ Excel export with formatting
- ✅ License SKU mapping
- ✅ Required permissions documented

**Saved to**: `scripts/Graph/Export-M365-Licenses.ps1`

---

### Example 4: 🧠 Strategic Analysis

```bash
/sc:business-panel "Analyze our IT automation strategy and ROI"
```

**You get**:
- ✅ Analysis from 9 business thought leaders:
  - 💼 **Porter**: Competitive positioning
  - 🔨 **Christensen**: Innovation approach
  - 🧭 **Drucker**: Management effectiveness
  - 🕸️ **Meadows**: Systems thinking
  - 🏆 **Collins**: Organizational excellence
- ✅ Strategic recommendations
- ✅ Risk assessment
- ✅ Implementation priorities

---

## 📖 Documentation

### 📚 Quick References (in `docs/`)

| Document | What's Inside |
|----------|---------------|
| **[PowerShell-GUI-Dark-Theme-Reference.md](docs/PowerShell-GUI-Dark-Theme-Reference.md)** | Complete dark theme guide (70+ controls) |
| **[superclaude-integration.md](docs/superclaude-integration.md)** | SuperClaude Framework complete guide |
| **[powershell-patterns.md](docs/powershell-patterns.md)** | Common patterns, error handling, logging |
| **[azure-deployment-guide.md](docs/azure-deployment-guide.md)** | Azure CLI, Static Web Apps, cost tips |
| **[microsoft-graph-examples.md](docs/microsoft-graph-examples.md)** | Auth, users, groups, Teams, batching |
| **[ad-quickref.md](docs/ad-quickref.md)** | AD cmdlets, filters, bulk ops, GPO |
| **[recommended-mcp-servers.md](docs/recommended-mcp-servers.md)** | MCP server analysis and setup |

### 🛠️ Setup Guides

| Guide | Purpose |
|-------|---------|
| **[SETUP_MCP_SERVERS.md](SETUP_MCP_SERVERS.md)** | Complete setup for SuperClaude + 8 MCP servers |
| **[PROJECT_COMPLETE.md](PROJECT_COMPLETE.md)** | Project completion summary and statistics |

---

## 🎯 Workflow Examples

### 🔄 Session-Based Development

```bash
# Session 1: Start project
/sc:brainstorm "Automate user onboarding process"
/sc:save

# Session 2: Implementation
/sc:load
/sc:implement "User onboarding automation framework"
/sc:save

# Session 3: Testing
/sc:load
/sc:test scripts/Onboarding/
/sc:reflect "User onboarding project"
```

---

### 🚀 Complete Deployment Pipeline

```bash
# Step 1: Expert consultation
@azure-deployer "Review architecture for high-traffic app"

# Step 2: Implementation
/webapp-deploy "Deploy React app with Functions backend"

# Step 3: Monitoring
/ps-azure "Setup Application Insights and alerts"

# Step 4: Documentation
/sc:document projects/my-app/
```

---

## 🔐 Security Best Practices

| Area | Best Practice |
|------|---------------|
| **Credentials** | ❌ Never hardcode • ✅ Use Azure Key Vault |
| **Permissions** | ✅ Always use least privilege approach |
| **Scripts** | ✅ Review before production • ✅ Test in dev first |
| **Git** | ✅ Add `.env` and credentials to `.gitignore` |
| **Audit** | ✅ Enable logging for all admin operations |

---

## 🐛 Troubleshooting

<details>
<summary><b>❓ MCP Servers Not Loading</b></summary>

**Solution**:
```bash
# Verify configuration
cat .claude/config.json

# Test MCP servers
npx -y @context7/mcp-server
npx -y @modelcontextprotocol/server-sequential-thinking

# Restart Claude Code
```
</details>

<details>
<summary><b>❓ PowerShell Module Not Found</b></summary>

**Solution**:
```powershell
# Install required modules
Install-Module ActiveDirectory -Scope CurrentUser
Install-Module Az -Scope CurrentUser
Install-Module Microsoft.Graph -Scope CurrentUser
Install-Module ExchangeOnlineManagement -Scope CurrentUser

# Update modules
Update-Module Az
Update-Module Microsoft.Graph
```
</details>

<details>
<summary><b>❓ Azure CLI Not Authenticated</b></summary>

**Solution**:
```bash
# Login to Azure
az login

# Verify subscription
az account show

# Set default subscription
az account set --subscription "Your Subscription Name"
```
</details>

---

## 📊 Workspace Structure

```
Claude_Code_Marketplace/
├── 📁 .claude/                    # Workspace configuration
│   ├── config.json                # MCP server configuration
│   ├── CLAUDE.md                  # Workspace behavior
│   ├── 📁 commands/               # 38+ slash commands
│   ├── 📁 agents/                 # 30 AI agents
│   ├── 📁 modes/                  # 7 behavioral modes
│   └── 📁 business/               # 9 business experts
├── 📁 docs/                       # Quick reference guides
│   ├── PowerShell-GUI-Dark-Theme-Reference.md
│   ├── superclaude-integration.md
│   ├── powershell-patterns.md
│   ├── azure-deployment-guide.md
│   ├── microsoft-graph-examples.md
│   ├── ad-quickref.md
│   └── recommended-mcp-servers.md
├── 📁 scripts/                    # Generated scripts by category
│   ├── AD/
│   ├── Azure/
│   ├── Entra/
│   ├── M365/
│   ├── Exchange/
│   ├── Graph/
│   └── Purview/
├── 📁 projects/                   # Web application projects
├── 📄 install.sh                  # 🌍 Global installation script
├── 📄 SETUP_MCP_SERVERS.md        # Complete setup guide
├── 📄 PROJECT_COMPLETE.md         # Completion summary
└── 📄 README.md                   # This file
```

---

## 🌟 What Makes This Special?

<table>
<tr>
<td width="50%">

### 🎯 Production-Ready Code

Every script includes:
- ✅ Error handling (try-catch)
- ✅ Input validation
- ✅ Verbose logging
- ✅ Module version checks
- ✅ Best practices
- ✅ Complete documentation

</td>
<td width="50%">

### 🚀 Always Up-to-Date

Context7 ensures:
- ✅ Latest cmdlet versions
- ✅ Current API specifications
- ✅ Microsoft best practices
- ✅ Newest SDK features
- ✅ Official documentation

</td>
</tr>
<tr>
<td>

### 🧠 Intelligent Workflows

SuperClaude provides:
- ✅ 16 cognitive personas
- ✅ Auto persona selection
- ✅ Systematic workflows
- ✅ Session memory
- ✅ Strategic analysis

</td>
<td>

### 🎨 Professional UI

Dark theme includes:
- ✅ Microsoft Fluent Design
- ✅ 70+ styled controls
- ✅ Accessibility compliance
- ✅ All state styling
- ✅ Modern appearance

</td>
</tr>
</table>

---

## 🔗 Resources

### 📚 Documentation

- [Claude Code Official Docs](https://docs.claude.com/en/docs/claude-code)
- [SuperClaude Framework](https://superclaude.netlify.app/docs/)
- [Model Context Protocol (MCP)](https://modelcontextprotocol.io/)
- [Microsoft Graph API](https://learn.microsoft.com/en-us/graph/)
- [Azure Static Web Apps](https://learn.microsoft.com/en-us/azure/static-web-apps/)

### 🛠️ PowerShell Modules

- [ActiveDirectory Module](https://learn.microsoft.com/en-us/powershell/module/activedirectory/)
- [Az PowerShell Module](https://learn.microsoft.com/en-us/powershell/azure/new-azureps-module-az)
- [Microsoft.Graph SDK](https://learn.microsoft.com/en-us/powershell/microsoftgraph/)
- [ExchangeOnlineManagement](https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell)

---

## 💬 Need Help?

1. **📖 Check Documentation**: Review [SETUP_MCP_SERVERS.md](SETUP_MCP_SERVERS.md)
2. **🔍 Search Commands**: Look in `.claude/commands/` for command details
3. **🤖 Ask Agents**: Use `@powershell-builder` or other agents for guidance
4. **📚 Quick Refs**: Browse `docs/` for quick reference guides

---

## 📈 Version History

### 🎉 Version 2.0 (Current)

**Major Enhancements**:
- ✅ SuperClaude Framework integration (25 commands, 16 personas)
- ✅ 8 MCP servers (up from 2)
- ✅ Business expert panel mode
- ✅ Professional dark theme for all GUIs
- ✅ Session management with save/load
- ✅ Systematic workflows and token efficiency

**Statistics**:
- **Commands**: 38+ (13 IT + 25 SuperClaude)
- **Agents**: 30 (5 IT + 16 SuperClaude + 9 business)
- **MCP Servers**: 8 configured
- **Documentation**: 11+ reference guides

---

<div align="center">

## 🚀 Ready to Transform Your IT Workflow?

**[🔧 Add to Claude Code](#-add-this-workspace-to-claude-code)** • **[⚡ Get Started](#-installation)** • **[📚 View Commands](#-command-categories)** • **[🤖 Meet the Agents](#-specialized-ai-agents)**

---

**Built with** ❤️ **for IT Administrators**

[![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?style=flat-square&logo=github)](https://github.com/durgesh0505/AD-Msg-Cladue-Workspace)
[![License](https://img.shields.io/badge/License-Personal-blue?style=flat-square)](LICENSE)
[![Version](https://img.shields.io/badge/Version-2.0-success?style=flat-square)](PROJECT_COMPLETE.md)

**Status**: ✅ **PRODUCTION READY** | **Last Updated**: 2025-10-16

</div>
