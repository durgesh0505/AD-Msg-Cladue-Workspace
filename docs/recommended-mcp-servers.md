# Recommended MCP Servers for IT Admin Workspace

**Research Date**: 2025-10-12
**Research Method**: Web search + Sequential Thinking MCP analysis

This document provides recommendations for additional free MCP servers that can enhance your IT admin workspace.

## Current MCP Configuration

Your workspace currently has:
1. **Context7** - Latest Microsoft SDK documentation
2. **Sequential Thinking** - Structured reasoning for complex problems

## Executive Summary

Based on comprehensive research and analysis, **6 additional free MCP servers** are recommended:

### Tier 1 - Must Add (Critical Value)
1. **Azure MCP Server** - Native Azure service integration
2. **Microsoft Learn MCP** - Real-time Microsoft documentation
3. **GitHub MCP Server** - GitHub Actions and workflow automation

### Tier 2 - High Value Add
4. **Memory MCP** - Persistent knowledge graph across sessions
5. **Filesystem MCP** - Secure file operations and script management
6. **Git MCP** - Version control for generated scripts

---

## Tier 1: Critical MCP Servers

### 1. Azure MCP Server ⭐⭐⭐

**Purpose**: Direct integration with Azure services

**Why Add This**:
- Native Azure CLI commands within Claude
- File storage operations (blob, files)
- Database and logs querying
- Complements your `/ps-azure`, `/webapp-deploy`, `/storage-setup` commands
- Official Microsoft implementation

**What It Enables**:
```bash
# Direct Azure operations without leaving Claude
"Create an Azure Storage Account and configure lifecycle policy"
"Query Azure Application Insights logs for errors"
"List all VMs across subscriptions with their status"
```

**Installation**:
```json
{
  "azure-mcp": {
    "command": "npx",
    "args": ["-y", "@azure/mcp@latest", "server", "start"],
    "description": "Azure service integration for CLI, storage, database, and logs"
  }
}
```

**Prerequisites**:
- Azure CLI installed: `az --version`
- Authenticated: `az login`
- Optional: Set namespace flag for specific Azure services

**Documentation**: https://learn.microsoft.com/en-us/azure/developer/azure-mcp-server/

**Status**: Public Preview (v0.6.0 as of Oct 2025)

---

### 2. Microsoft Learn MCP Server ⭐⭐⭐

**Purpose**: Real-time access to Microsoft Learn documentation

**Why Add This**:
- Official Microsoft documentation and tutorials
- Complements Context7 (Context7 = SDK/API, MS Learn = conceptual/tutorials)
- Always up-to-date with latest Microsoft admin guides
- Code samples directly from Microsoft Learn

**What It Enables**:
```bash
# Get latest Microsoft documentation
"Show me the latest best practices for Exchange hybrid deployment"
"What's the recommended approach for Entra ID conditional access?"
"Get code samples for Microsoft Graph batch operations"
```

**Installation**:

**Option 1 - HTTP Transport (Recommended)**:
```json
{
  "microsoft-learn": {
    "command": "npx",
    "args": ["-y", "mcp-remote", "https://learn.microsoft.com/api/mcp"],
    "description": "Real-time Microsoft Learn documentation and code samples"
  }
}
```

**Option 2 - Claude Code CLI**:
```bash
claude mcp add --transport http microsoft_docs_mcp https://learn.microsoft.com/api/mcp
```

**Prerequisites**:
- Internet connection
- None (uses HTTP transport)

**Documentation**: https://github.com/MicrosoftDocs/mcp

**Status**: Production (Official Microsoft implementation)

---

### 3. GitHub MCP Server ⭐⭐⭐

**Purpose**: GitHub repository, Actions, PR, and issue management

**Why Add This**:
- Enhances your `/github-workflow` command
- Manage GitHub Actions workflows
- Create/manage pull requests and issues
- Repository operations (clone, commit, push)
- Automate GitHub-based deployments

**What It Enables**:
```bash
# GitHub automation
"Create a PR for the new feature branch"
"Check status of GitHub Actions workflows"
"Create an issue for the bug I found"
"List all open PRs in the repository"
```

**Installation**:

**NOTE**: The `@modelcontextprotocol/server-github` package is deprecated. Use the official GitHub implementation:

```json
{
  "github": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-github"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "<YOUR_GITHUB_PAT>"
    },
    "description": "GitHub integration for Actions, PRs, issues, and repositories"
  }
}
```

**Prerequisites**:
1. **GitHub Personal Access Token** (required)
   - Go to: https://github.com/settings/tokens
   - Click "Generate new token (classic)"
   - Required scopes: `repo`, `workflow`, `read:org`
   - Copy token and add to environment variable

2. **Set Environment Variable**:
   ```bash
   # Windows (PowerShell)
   $env:GITHUB_PERSONAL_ACCESS_TOKEN="ghp_your_token_here"

   # Linux/Mac
   export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_your_token_here"
   ```

**Documentation**: https://github.com/modelcontextprotocol/servers/tree/main/src/github

**Status**: Production (Note: Package being moved to `github/github-mcp-server`)

---

## Tier 2: High Value MCP Servers

### 4. Memory MCP ⭐⭐

**Purpose**: Knowledge graph-based persistent memory system

**Why Add This**:
- Remembers script patterns across sessions
- Learns your common admin operations
- Tracks user preferences for script generation
- Maintains context between Claude Code sessions

**What It Enables**:
```bash
# Cross-session learning
"Remember that I prefer XAML GUIs with dark theme"
"Recall the AD user creation pattern I use"
"What scripts have I generated for Exchange in the past?"
"Remember my preferred Azure resource naming convention"
```

**Installation**:
```json
{
  "memory": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-memory"],
    "description": "Knowledge graph memory for persistent learning across sessions"
  }
}
```

**Prerequisites**:
- None

**Documentation**: https://github.com/modelcontextprotocol/servers/tree/main/src/memory

**Status**: Production (v2025.9.25)

---

### 5. Filesystem MCP ⭐⭐

**Purpose**: Secure file operations with permission controls

**Why Add This**:
- Better script organization in `scripts/` directory
- Bulk file operations
- Safe file search and manipulation
- Directory management

**What It Enables**:
```bash
# Advanced file operations
"Organize all PowerShell scripts by category"
"Find all scripts that connect to Exchange"
"Create directory structure for new project"
"Move all AD scripts to scripts/AD/ directory"
```

**Installation**:
```json
{
  "filesystem": {
    "command": "npx",
    "args": [
      "-y",
      "@modelcontextprotocol/server-filesystem",
      "/mnt/c/Users/durge/Documents/ClaudeCode/Claude_Code_Marketplace/scripts",
      "/mnt/c/Users/durge/Documents/ClaudeCode/Claude_Code_Marketplace/projects",
      "/mnt/c/Users/durge/Documents/ClaudeCode/Claude_Code_Marketplace/docs"
    ],
    "description": "Secure file operations for script and project management"
  }
}
```

**Important**: Only paths listed in `args` are accessible (security feature)

**Prerequisites**:
- None

**Documentation**: https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem

**Status**: Production (v2025.8.21)

---

### 6. Git MCP ⭐⭐

**Purpose**: Git repository operations and version control

**Why Add This**:
- Version control for generated scripts
- Track script evolution over time
- Repository management
- Git operations within Claude

**What It Enables**:
```bash
# Git automation
"Initialize git repository for scripts directory"
"Commit all new PowerShell scripts"
"Show git diff for recent changes"
"Create a new branch for Exchange migration scripts"
```

**Installation**:
```json
{
  "git": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-git"],
    "description": "Git repository operations for version control"
  }
}
```

**Prerequisites**:
- Git installed: `git --version`

**Documentation**: https://github.com/modelcontextprotocol/servers/tree/main/src/git

**Status**: Production

---

## Additional MCP Servers (Optional)

### 7. SQLite MCP (Optional)

**Use Case**: If you need to store admin operation logs, script usage metrics, or inventory databases

**Installation**:
```json
{
  "sqlite": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-sqlite", "--db-path", "/path/to/database.db"],
    "description": "SQLite database operations"
  }
}
```

**Status**: Available but not critical for most IT admin workflows

---

### 8. Time MCP (Optional)

**Use Case**: If you need timezone handling for scheduling scripts or global admin operations

**Installation**:
```json
{
  "time": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-time"],
    "description": "Timezone-aware time operations"
  }
}
```

**Status**: Available but basic timezone handling can be done in PowerShell

---

### 9. Slack MCP (Optional)

**Use Case**: If you want notifications for long-running scripts or admin alerts

**Installation**:
```json
{
  "slack": {
    "command": "npx",
    "args": ["-y", "slack-mcp-server"],
    "env": {
      "SLACK_BOT_TOKEN": "<YOUR_SLACK_BOT_TOKEN>"
    },
    "description": "Slack notifications and messaging"
  }
}
```

**Status**: Available but requires Slack workspace setup

---

## Phased Implementation Plan

### Phase 1: Critical Additions (Recommended Now)

Add the 3 Tier 1 servers for immediate value:

1. **Azure MCP** - Native Azure integration
2. **Microsoft Learn MCP** - Official documentation
3. **GitHub MCP** - Workflow automation

**Expected Benefit**:
- Direct Azure operations
- Latest Microsoft admin documentation
- GitHub Actions automation

**Time to Implement**: 15-30 minutes

---

### Phase 2: Enhancement (Optional, After Testing Phase 1)

Add the 3 Tier 2 servers for additional capabilities:

4. **Memory MCP** - Persistent learning
5. **Filesystem MCP** - File management
6. **Git MCP** - Version control

**Expected Benefit**:
- Cross-session learning
- Better script organization
- Git-based version control

**Time to Implement**: 15-20 minutes

---

## Complete Updated Configuration

Here's your updated `.claude/config.json` with all recommended MCP servers:

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@context7/mcp-server"],
      "description": "Latest Microsoft SDK documentation and best practices"
    },
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"],
      "description": "Structured reasoning for complex troubleshooting and architecture decisions"
    },
    "azure-mcp": {
      "command": "npx",
      "args": ["-y", "@azure/mcp@latest", "server", "start"],
      "description": "Azure service integration for CLI, storage, database, and logs"
    },
    "microsoft-learn": {
      "command": "npx",
      "args": ["-y", "mcp-remote", "https://learn.microsoft.com/api/mcp"],
      "description": "Real-time Microsoft Learn documentation and code samples"
    },
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "<YOUR_GITHUB_PAT>"
      },
      "description": "GitHub integration for Actions, PRs, issues, and repositories"
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"],
      "description": "Knowledge graph memory for persistent learning across sessions"
    },
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/mnt/c/Users/durge/Documents/ClaudeCode/Claude_Code_Marketplace/scripts",
        "/mnt/c/Users/durge/Documents/ClaudeCode/Claude_Code_Marketplace/projects",
        "/mnt/c/Users/durge/Documents/ClaudeCode/Claude_Code_Marketplace/docs"
      ],
      "description": "Secure file operations for script and project management"
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git"],
      "description": "Git repository operations for version control"
    }
  }
}
```

**Total MCP Servers**: 8 (Current: 2 → After: 8)

---

## Setup Instructions

### Step 1: Prerequisites

1. **Verify Node.js Installation**:
   ```bash
   node --version  # Should be 16+
   npm --version
   ```

2. **Verify Azure CLI** (for Azure MCP):
   ```bash
   az --version
   az login
   ```

3. **Create GitHub Personal Access Token** (for GitHub MCP):
   - Go to: https://github.com/settings/tokens
   - Generate new token (classic)
   - Scopes: `repo`, `workflow`, `read:org`
   - Copy token

4. **Set Environment Variable**:
   ```powershell
   # Add to PowerShell profile for persistence
   $env:GITHUB_PERSONAL_ACCESS_TOKEN="ghp_your_token_here"
   ```

### Step 2: Backup Current Configuration

```bash
cp .claude/config.json .claude/config.json.backup
```

### Step 3: Update Configuration

**Option A - Manual Edit**:
1. Open `.claude/config.json`
2. Add new MCP server configurations
3. Replace `<YOUR_GITHUB_PAT>` with your actual token
4. Save file

**Option B - Full Replace**:
1. Copy the complete configuration above
2. Replace contents of `.claude/config.json`
3. Update paths if your workspace is in a different location
4. Replace `<YOUR_GITHUB_PAT>` with your actual token

### Step 4: Test MCP Servers

Restart Claude Code and test each MCP server:

```bash
# Test Azure MCP
/ps-azure "List all resource groups"

# Test Microsoft Learn MCP
"Get latest best practices for Entra ID conditional access"

# Test GitHub MCP
"List repositories in my GitHub account"

# Test Memory MCP
"Remember that I prefer error logging to files in C:\Logs"

# Test Filesystem MCP
"List all PowerShell scripts in scripts/AD directory"

# Test Git MCP
"Show git status of this repository"
```

### Step 5: Verify Installation

Check Claude Code logs for any MCP server errors:
- Look for connection success messages
- Verify no authentication errors
- Confirm all 8 servers loaded successfully

---

## Troubleshooting

### Issue: "spawn npx ENOENT" Error

**Solution**:
1. Verify Node.js and npm are in PATH
2. Restart terminal/Claude Code
3. Try global installation: `npm install -g <package>`

### Issue: GitHub MCP Authentication Failed

**Solution**:
1. Verify token has correct scopes (`repo`, `workflow`, `read:org`)
2. Check token is not expired
3. Verify environment variable is set: `echo $env:GITHUB_PERSONAL_ACCESS_TOKEN`

### Issue: Azure MCP Not Working

**Solution**:
1. Verify Azure CLI is installed: `az --version`
2. Authenticate: `az login`
3. Check default subscription: `az account show`

### Issue: Microsoft Learn MCP Connection Failed

**Solution**:
1. Check internet connection
2. Verify URL is correct: `https://learn.microsoft.com/api/mcp`
3. Try browser access to URL to verify it's reachable

### Issue: Filesystem MCP "Access Denied"

**Solution**:
1. Verify paths in config exist and are absolute paths
2. Check permissions on directories
3. Ensure paths use correct separators for OS (WSL uses `/mnt/c/...`)

---

## Performance Considerations

### MCP Server Load

**Current Setup**: 2 MCP servers (low overhead)
**After Phase 1**: 5 MCP servers (moderate overhead)
**After Phase 2**: 8 MCP servers (higher overhead, still manageable)

### Recommendations:
- Start with Phase 1 (3 new servers)
- Test performance for 1-2 weeks
- Add Phase 2 servers if needed
- Monitor Claude Code startup time and responsiveness

### Memory Usage:
Each MCP server adds approximately 50-150MB of memory. With 8 servers, expect ~800MB-1.2GB total for all MCP processes.

---

## Benefits Summary

### Before (Current Setup)
- Context7: Latest SDK documentation
- Sequential Thinking: Complex reasoning

### After Phase 1 (+3 servers)
- ✅ Native Azure operations
- ✅ Real-time Microsoft documentation
- ✅ GitHub Actions automation
- ✅ Enhanced deployment workflows

### After Phase 2 (+6 servers)
- ✅ Persistent learning across sessions
- ✅ Advanced file management
- ✅ Git version control
- ✅ Comprehensive Microsoft stack automation

---

## Cost Analysis

**All recommended MCP servers are FREE and open-source:**

- ✅ Azure MCP: Free (uses your existing Azure subscription)
- ✅ Microsoft Learn MCP: Free (public API)
- ✅ GitHub MCP: Free (uses your GitHub account)
- ✅ Memory MCP: Free (local storage)
- ✅ Filesystem MCP: Free (local file operations)
- ✅ Git MCP: Free (local git operations)

**No additional costs for adding these MCP servers.**

---

## Comparison Matrix

| MCP Server | Purpose | Integration | Priority | Setup Time |
|------------|---------|-------------|----------|------------|
| **Context7** | SDK docs | Current | ✅ Installed | - |
| **Sequential Thinking** | Reasoning | Current | ✅ Installed | - |
| **Azure MCP** | Azure services | New | ⭐⭐⭐ Critical | 5 min |
| **Microsoft Learn MCP** | Official docs | New | ⭐⭐⭐ Critical | 5 min |
| **GitHub MCP** | GitHub automation | New | ⭐⭐⭐ Critical | 10 min |
| **Memory MCP** | Persistent learning | New | ⭐⭐ High | 2 min |
| **Filesystem MCP** | File management | New | ⭐⭐ High | 5 min |
| **Git MCP** | Version control | New | ⭐⭐ High | 2 min |

---

## Next Steps

1. **Review this document** and decide which servers to add
2. **Start with Phase 1** (Azure, Microsoft Learn, GitHub)
3. **Test for 1-2 weeks** to evaluate value
4. **Add Phase 2** if you want additional capabilities
5. **Provide feedback** on which servers are most useful

---

## Additional Resources

- [Model Context Protocol Documentation](https://modelcontextprotocol.io/)
- [Awesome MCP Servers](https://github.com/punkpeye/awesome-mcp-servers)
- [Azure MCP Server Docs](https://learn.microsoft.com/en-us/azure/developer/azure-mcp-server/)
- [Microsoft Learn MCP GitHub](https://github.com/MicrosoftDocs/mcp)
- [MCP Server Catalog](https://mcp.so/)

---

**Document Version**: 1.0
**Last Updated**: 2025-10-12
**Research Completed**: Using Sequential Thinking MCP and web research
