# Workspace Setup Instructions

**Configuration Updated**: 2025-10-12

Your workspace now has **8 MCP servers** + **SuperClaude Framework** configured and ready to use!

## Current Configuration Status

### SuperClaude Framework
✅ **Recommended** - Meta-programming configuration framework:
- 25 specialized `/sc:` commands for development workflows
- 16 cognitive AI personas (Analyzer, Architect, Builder, etc.)
- 7 behavioral modes (Brainstorming, Introspection, Orchestration, etc.)
- 70% token-reduction pipeline for efficiency
- Business expert panel mode with 9 thought leaders
- Cross-session memory and project context management

### MCP Servers
✅ **Installed (2)** - Already working:
1. Context7 - Microsoft SDK documentation
2. Sequential Thinking - Complex reasoning

✅ **Added (6)** - Configured, needs setup:
3. Azure MCP - Azure service integration
4. Microsoft Learn MCP - Official Microsoft documentation
5. GitHub MCP - GitHub automation ⚠️ **Requires GitHub token**
6. Memory MCP - Persistent learning
7. Filesystem MCP - File operations
8. Git MCP - Version control

---

## SuperClaude Framework Installation

SuperClaude Framework is a meta-programming configuration layer that enhances Claude Code with specialized development capabilities, systematic workflows, and cognitive personas.

### Why Install SuperClaude?

**For IT Admin Workspace**:
- **`/sc:implement`** - Intelligent feature implementation with persona activation
- **`/sc:analyze`** - Comprehensive code analysis (quality, security, performance)
- **`/sc:design`** - System architecture and API design with specifications
- **`/sc:test`** - Execute tests with coverage analysis and reporting
- **`/sc:troubleshoot`** - Systematic issue diagnosis and resolution
- **`/sc:document`** - Generate focused component and API documentation
- **`/sc:save`** / **`/sc:load`** - Session lifecycle with project context persistence
- **`/sc:business-panel`** - Strategic analysis with 9 business thought leaders

**Cognitive Personas** (auto-activated based on task):
- **Analyzer** - Investigation and code analysis
- **Architect** - System design and architecture
- **Builder** - Feature implementation
- **Debugger** - Problem diagnosis
- **Optimizer** - Performance tuning
- **Guardian** - Security analysis
- **Documenter** - Documentation generation
- **Mentor** - Learning and explanation

### Automatic Installation

**One-Command Installation (Linux/macOS/WSL)**

Navigate to your workspace and run this single command:

```bash
cd /mnt/c/Users/durge/Documents/ClaudeCode/Claude_Code_Marketplace && \
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

This command automatically:
1. Detects your operating system
2. Installs pipx if not already present
3. Installs SuperClaude Framework
4. Runs `SuperClaude install` to setup workspace
5. Configures 25 slash commands, 16 personas, and 7 behavioral modes

**What happens:**
- Ubuntu/Debian: Uses `apt-get` to install pipx
- macOS: Uses `brew` to install pipx
- Other systems: Uses `pip` to install pipx
- Then installs and configures SuperClaude automatically

### What Gets Installed?

The `SuperClaude install` command copies framework files into `.claude/` directory:

**Created Files**:
- `.claude/commands/sc-*.md` - 25 slash command definitions
- `.claude/agents/*.md` - 16 specialized agent personas
- `.claude/modes/*.md` - 7 behavioral mode configurations
- `.claude/business/*.md` - Business expert panel components
- `.claude/frameworks/*.md` - Development framework patterns
- `.claude/symbols.md` - Token-efficient symbol system

**Preserved Files** (not overwritten):
- `.claude/CLAUDE.md` - Your custom workspace instructions
- `.claude/config.json` - MCP server configuration
- Custom slash commands you've created
- Custom agents and configurations

### Verification

After installation, test SuperClaude commands:

```bash
# Test implementation command
/sc:implement "Create a simple PowerShell function to validate email addresses"

# Test analysis command
/sc:analyze scripts/AD/

# Test save/load (session management)
/sc:save
/sc:load

# Test business panel
/sc:business-panel "Analyze our IT automation strategy"
```

**Expected Results**:
- Commands execute with structured workflows
- Appropriate personas activate automatically
- Token-efficient symbol communication
- Cross-session context preservation

---

## Required Setup Steps

### Step 1: GitHub Personal Access Token (REQUIRED)

The GitHub MCP server needs a personal access token to work.

#### Create GitHub Token:

1. **Go to GitHub Settings**:
   ```
   https://github.com/settings/tokens
   ```

2. **Click "Generate new token (classic)"**

3. **Configure Token**:
   - **Note**: "Claude Code Workspace Access"
   - **Expiration**: Choose your preference (90 days recommended)
   - **Select scopes**:
     - ✅ `repo` (Full control of private repositories)
     - ✅ `workflow` (Update GitHub Action workflows)
     - ✅ `read:org` (Read org and team membership)

4. **Click "Generate token"**

5. **Copy the token** (starts with `ghp_...`)

#### Set GitHub Token:

**Option A - Environment Variable (Recommended)**:

**Windows PowerShell**:
```powershell
# Set for current session
$env:GITHUB_PERSONAL_ACCESS_TOKEN="ghp_your_token_here"

# Set permanently (add to PowerShell profile)
Add-Content $PROFILE "`n`$env:GITHUB_PERSONAL_ACCESS_TOKEN='ghp_your_token_here'"
```

**Linux/Mac**:
```bash
# Set for current session
export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_your_token_here"

# Set permanently (add to ~/.bashrc or ~/.zshrc)
echo "export GITHUB_PERSONAL_ACCESS_TOKEN='ghp_your_token_here'" >> ~/.bashrc
```

**Option B - Direct Config File Edit**:

Edit `.claude/config.json` and replace:
```json
"GITHUB_PERSONAL_ACCESS_TOKEN": "REPLACE_WITH_YOUR_GITHUB_TOKEN"
```

With:
```json
"GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_your_actual_token_here"
```

⚠️ **Warning**: Don't commit your token to git! Add `.claude/config.json` to `.gitignore` if storing token directly.

---

### Step 2: Verify Prerequisites

**Check Node.js** (required for all MCP servers):
```bash
node --version  # Should be v16 or higher
npm --version
```

**Check Azure CLI** (required for Azure MCP):
```bash
az --version
az login  # Authenticate to Azure
az account show  # Verify logged in
```

**Check Git** (required for Git MCP):
```bash
git --version
```

---

### Step 3: Restart Claude Code

After setting up the GitHub token, restart Claude Code to load all MCP servers:

1. Close Claude Code completely
2. Reopen Claude Code
3. Navigate to your workspace directory
4. MCP servers will auto-load on startup

---

## Verification Tests

Once Claude Code restarts, test each MCP server:

### Test 1: Azure MCP
```bash
/ps-azure "List all resource groups in my subscription"
```
**Expected**: Script to list Azure resource groups using Az module

### Test 2: Microsoft Learn MCP
```
"Show me the latest Microsoft best practices for Entra ID conditional access"
```
**Expected**: Documentation from Microsoft Learn

### Test 3: GitHub MCP
```
"List all repositories in my GitHub account"
```
**Expected**: List of your GitHub repositories

### Test 4: Memory MCP
```
"Remember that I prefer PowerShell scripts with detailed error logging to C:\Logs"
```
**Expected**: Confirmation that preference is stored

### Test 5: Filesystem MCP
```
"List all PowerShell scripts in the scripts/AD directory"
```
**Expected**: List of files in scripts/AD/

### Test 6: Git MCP
```
"Show the git status of this workspace"
```
**Expected**: Git status output

### Test 7: Context7 (Already Working)
```bash
/ps-graph "Get all M365 users with licenses"
```
**Expected**: Script with latest Microsoft.Graph cmdlets

### Test 8: Sequential Thinking (Already Working)
```
/ps-script "Design a modular AD user provisioning system" --think
```
**Expected**: Structured reasoning followed by script generation

---

## What Each MCP Server Adds

### Azure MCP
**Enhances**:
- `/ps-azure` command - Direct Azure CLI integration
- `/webapp-deploy` command - Native Azure Static Web Apps operations
- `/storage-setup` command - Direct Azure Storage management

**New Capabilities**:
- Query Azure logs and Application Insights
- Manage Azure resources directly
- Access Azure Key Vault secrets

---

### Microsoft Learn MCP
**Enhances**:
- All admin commands - Official Microsoft documentation
- PowerShell commands - Tutorial-style guidance

**New Capabilities**:
- Real-time Microsoft Learn content
- Official code samples
- Conceptual documentation (complements Context7's API docs)

---

### GitHub MCP
**Enhances**:
- `/github-workflow` command - Direct GitHub Actions management
- All commands - PR and issue creation for scripts

**New Capabilities**:
- Create/manage pull requests
- Create/manage GitHub issues
- Check GitHub Actions workflow status
- Repository operations (clone, commit, push)

---

### Memory MCP
**Enhances**:
- All commands - Learns your patterns and preferences

**New Capabilities**:
- Remembers script generation preferences
- Tracks common operations
- Persists knowledge across sessions
- Builds knowledge graph of your workspace

---

### Filesystem MCP
**Enhances**:
- Script organization and management
- Project file operations

**New Capabilities**:
- Secure bulk file operations
- Directory management
- File search across workspace
- Script categorization

---

### Git MCP
**Enhances**:
- Version control for generated scripts
- Repository management

**New Capabilities**:
- Git operations within Claude
- Commit script changes
- Branch management
- Git history tracking

---

## Troubleshooting

### Issue: "GitHub MCP authentication failed"

**Solution**:
1. Verify token has correct scopes: `repo`, `workflow`, `read:org`
2. Check token hasn't expired
3. Verify environment variable is set:
   ```powershell
   echo $env:GITHUB_PERSONAL_ACCESS_TOKEN
   ```
4. Restart Claude Code after setting token

---

### Issue: "Azure MCP not responding"

**Solution**:
1. Verify Azure CLI installed: `az --version`
2. Authenticate: `az login`
3. Check subscription: `az account show`
4. Restart Claude Code

---

### Issue: "Microsoft Learn MCP connection failed"

**Solution**:
1. Check internet connection
2. Try accessing URL in browser: `https://learn.microsoft.com/api/mcp`
3. Check firewall/proxy settings
4. Restart Claude Code

---

### Issue: "Filesystem MCP access denied"

**Solution**:
1. Verify paths exist:
   ```bash
   ls /mnt/c/Users/durge/Documents/ClaudeCode/Claude_Code_Marketplace/scripts
   ```
2. Check directory permissions
3. Ensure paths are absolute, not relative

---

### Issue: "MCP server failed to start"

**Solution**:
1. Check Node.js version: `node --version` (must be 16+)
2. Clear npm cache: `npm cache clean --force`
3. Try manual installation:
   ```bash
   npx -y @azure/mcp@latest server start
   npx -y @modelcontextprotocol/server-github
   npx -y @modelcontextprotocol/server-memory
   ```
4. Check Claude Code logs for specific errors

---

## Performance Notes

### Startup Time
- **Before**: 2 MCP servers (~2-3 seconds)
- **After**: 8 MCP servers (~5-8 seconds)

### Memory Usage
- Each MCP server: ~50-150MB
- Total additional memory: ~400-900MB
- Recommended RAM: 8GB+ for optimal performance

### Auto-Installation
All MCP servers will auto-install on first use via `npx -y` (no pre-installation needed).

---

## Security Best Practices

### GitHub Token Security
1. ✅ Use environment variables (don't store in config file)
2. ✅ Set token expiration (90 days recommended)
3. ✅ Use minimum required scopes
4. ✅ Add `.claude/config.json` to `.gitignore` if storing token
5. ✅ Rotate tokens periodically

### Filesystem Security
- ✅ Filesystem MCP only accesses listed paths
- ✅ No access outside `scripts/`, `projects/`, `docs/`
- ✅ Add more paths only if needed

### Azure Security
- ✅ Use `az login` (no credentials in config)
- ✅ Leverage managed identities when possible
- ✅ Follow least privilege for Azure RBAC

---

## Disable MCP Servers (Optional)

If you want to disable specific MCP servers:

1. Open `.claude/config.json`
2. Comment out or remove the server configuration
3. Restart Claude Code

**Example - Disable GitHub MCP**:
```json
{
  "mcpServers": {
    "context7": { ... },
    // "github": { ... }  <-- Commented out
  }
}
```

---

## Next Steps

### Initial Setup
1. ✅ **Install SuperClaude Framework** (see SuperClaude Installation section above)
2. ✅ **Set GitHub token** (Step 1 - Required Setup Steps)
3. ✅ **Verify prerequisites** (Step 2 - Node.js, Azure CLI, Git)
4. ✅ **Restart Claude Code** (Step 3)

### Verification
5. ✅ **Test SuperClaude commands** (see SuperClaude Verification section)
6. ✅ **Run MCP verification tests** (see MCP Verification Tests section)
7. ✅ **Start using enhanced workspace**!

---

## Getting Help

### Documentation
- See `docs/recommended-mcp-servers.md` for detailed MCP server information
- See `.claude/CLAUDE.md` for workspace behavior
- See `README.md` for complete workspace guide
- [SuperClaude Framework GitHub](https://github.com/SuperClaude-Org/SuperClaude_Framework)
- [SuperClaude Documentation](https://superclaude.netlify.app/docs/)

### MCP Server Issues
- [Model Context Protocol Docs](https://modelcontextprotocol.io/)
- [Azure MCP Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-mcp-server/)
- [MCP Servers Repository](https://github.com/modelcontextprotocol/servers)

### SuperClaude Framework Issues
- [SuperClaude GitHub Issues](https://github.com/SuperClaude-Org/SuperClaude_Framework/issues)
- [SuperClaude Community](https://github.com/SuperClaude-Org)

---

**Version**: 2.0
**Configuration Date**: 2025-10-12
**Components**: SuperClaude Framework + 8 MCP Servers
**Status**: ⚠️ Requires SuperClaude installation + GitHub token setup
