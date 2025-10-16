#!/bin/bash

# IT Admin Workspace for Claude Code - Global Installation Script
# This script installs all commands, agents, and configurations globally

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to print colored output
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_header() {
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

# Print banner
clear
echo -e "${BLUE}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║   IT Admin Workspace for Claude Code                     ║
║   Global Installation                                     ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

print_info "This script will install the IT Admin Workspace globally"
print_info "All commands and agents will be available from any directory"
echo ""

# Step 1: Check prerequisites
print_header "Step 1/5: Checking Prerequisites"

# Check for Python
if ! command -v python3 &> /dev/null; then
    print_error "Python 3 is required but not installed"
    print_info "Install Python 3.8+ and run this script again"
    exit 1
fi
print_success "Python 3 found: $(python3 --version)"

# Check for Git
if ! command -v git &> /dev/null; then
    print_error "Git is required but not installed"
    print_info "Install Git and run this script again"
    exit 1
fi
print_success "Git found: $(git --version | head -n1)"

# Step 2: Install pipx if needed
print_header "Step 2/5: Installing pipx (if needed)"

if ! command -v pipx &> /dev/null; then
    print_info "pipx not found, installing..."

    if command -v apt-get &> /dev/null; then
        print_info "Detected Debian/Ubuntu system"
        sudo apt-get update && sudo apt-get install -y pipx
    elif command -v brew &> /dev/null; then
        print_info "Detected macOS with Homebrew"
        brew install pipx
    else
        print_info "Using pip to install pipx"
        python3 -m pip install --user pipx
        python3 -m pipx ensurepath
        export PATH="$HOME/.local/bin:$PATH"
    fi
    print_success "pipx installed successfully"
else
    print_success "pipx already installed"
fi

# Step 3: Install SuperClaude Framework
print_header "Step 3/5: Installing SuperClaude Framework"

print_info "Installing SuperClaude Framework..."
pipx install SuperClaude --force 2>/dev/null || pipx install SuperClaude
print_success "SuperClaude Framework installed"

print_info "Running SuperClaude install to setup workspace..."
SuperClaude install
print_success "SuperClaude workspace configured"

# Step 4: Install IT Admin Commands and Agents
print_header "Step 4/5: Installing IT Admin Commands & Agents"

# Create directories
mkdir -p ~/.claude/commands
mkdir -p ~/.claude/agents
print_success "Created Claude Code directories"

# Get the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy IT Admin commands (13 commands)
print_info "Installing IT Admin commands..."
cp "$SCRIPT_DIR/.claude/commands/ps-"*.md ~/.claude/commands/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/commands/ad-admin.md" ~/.claude/commands/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/commands/entra-admin.md" ~/.claude/commands/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/commands/m365-admin.md" ~/.claude/commands/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/commands/exchange-admin.md" ~/.claude/commands/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/commands/purview-admin.md" ~/.claude/commands/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/commands/webapp-deploy.md" ~/.claude/commands/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/commands/storage-setup.md" ~/.claude/commands/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/commands/github-workflow.md" ~/.claude/commands/ 2>/dev/null || true

COMMAND_COUNT=$(ls ~/.claude/commands/*.md 2>/dev/null | wc -l)
print_success "Installed IT Admin commands ($COMMAND_COUNT total commands)"

# Copy IT Admin agents (5 agents)
print_info "Installing IT Admin agents..."
cp "$SCRIPT_DIR/.claude/agents/powershell-builder.md" ~/.claude/agents/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/agents/azure-deployer.md" ~/.claude/agents/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/agents/microsoft-graph-expert.md" ~/.claude/agents/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/agents/ad-expert.md" ~/.claude/agents/ 2>/dev/null || true
cp "$SCRIPT_DIR/.claude/agents/exchange-expert.md" ~/.claude/agents/ 2>/dev/null || true

AGENT_COUNT=$(ls ~/.claude/agents/*.md 2>/dev/null | wc -l)
print_success "Installed IT Admin agents ($AGENT_COUNT total agents)"

# Merge CLAUDE.md configuration
print_info "Merging workspace configuration..."
if [ -f "$SCRIPT_DIR/.claude/CLAUDE.md" ]; then
    # Check if project CLAUDE.md is already in global CLAUDE.md
    if ! grep -q "Personal IT Admin Workspace" ~/.claude/CLAUDE.md 2>/dev/null; then
        echo "" >> ~/.claude/CLAUDE.md
        echo "# ═══════════════════════════════════════════════════" >> ~/.claude/CLAUDE.md
        echo "# IT Admin Workspace Configuration" >> ~/.claude/CLAUDE.md
        echo "# ═══════════════════════════════════════════════════" >> ~/.claude/CLAUDE.md
        echo "" >> ~/.claude/CLAUDE.md
        cat "$SCRIPT_DIR/.claude/CLAUDE.md" >> ~/.claude/CLAUDE.md
        print_success "Merged IT Admin workspace configuration"
    else
        print_warning "IT Admin configuration already in global CLAUDE.md (skipped)"
    fi
fi

# Copy MCP server configuration (backup existing)
print_info "Setting up MCP server configuration..."
if [ -f ~/.claude/config.json ]; then
    print_warning "Backing up existing config.json to config.json.backup"
    cp ~/.claude/config.json ~/.claude/config.json.backup
fi
cp "$SCRIPT_DIR/.claude/config.json" ~/.claude/config.json
print_success "MCP server configuration installed"

# Step 5: Copy documentation for reference
print_header "Step 5/5: Setting Up Documentation"

# Create a symlink or copy docs to home directory
DOCS_DIR="$HOME/IT-Admin-Workspace-Docs"
if [ ! -d "$DOCS_DIR" ]; then
    print_info "Copying documentation to $DOCS_DIR"
    cp -r "$SCRIPT_DIR/docs" "$DOCS_DIR"
    print_success "Documentation copied to: $DOCS_DIR"
else
    print_warning "Documentation directory already exists at: $DOCS_DIR"
fi

# Final summary
print_header "Installation Complete! 🎉"

echo -e "${GREEN}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════╗
║                                                           ║
║   ✅ IT Admin Workspace Installed Successfully!          ║
║                                                           ║
╚═══════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

print_success "All commands and agents are now available globally!"
echo ""
print_info "What's Installed:"
echo "  📦 SuperClaude Framework (25 commands, 16 personas, 7 modes)"
echo "  🔧 IT Admin Commands (13 commands)"
echo "  🤖 IT Admin Agents (5 specialized agents)"
echo "  ⚡ MCP Servers (8 configured servers)"
echo "  📚 Documentation: $DOCS_DIR"
echo ""
print_info "Quick Test:"
echo "  1. Navigate to any directory: cd ~"
echo "  2. Open Claude Code: claude-code ."
echo "  3. Type '/' to see all commands"
echo "  4. Try: /ps-script \"Get system information\""
echo ""
print_info "Total Commands Available: 38+"
print_info "Total Agents Available: 30"
echo ""
print_warning "Note: Restart Claude Code to load all components"
echo ""
print_info "Documentation: $DOCS_DIR"
print_info "GitHub: https://github.com/durgesh0505/AD-Msg-Cladue-Workspace"
echo ""
print_success "Happy automating! 🚀"
echo ""
