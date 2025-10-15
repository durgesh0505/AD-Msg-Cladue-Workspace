# Reasoning Integration Guide

**Core Innovation**: Every complex infrastructure decision in this marketplace uses [Sequential Thinking MCP](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking) for transparent, auditable reasoning.

## Why Reasoning Integration?

### The Problem
Traditional infrastructure tools execute actions without explaining **why**:
- "Mailbox migration failed" - but why did this approach fail?
- "Scale to 5 VMs" - but why 5? Why not 3 or 10?
- "Apply GPO to this OU" - but what are the implications?

### The Solution
**Reasoning-augmented tools** expose decision-making process:
```
Thought 1: Analyze current mail flow configuration
Thought 2: Identify connector authentication method (OAuth vs Basic)
Thought 3: Hypothesis: External mail failing due to OAuth token expiration
Thought 4: Validate hypothesis by checking connector logs
Thought 5: Conclusion: Renew OAuth token, implement token refresh automation
→ Execute fix with documented rationale
```

### Benefits
- **Transparency**: Understand why recommendations are made
- **Auditability**: Review decision rationale post-execution
- **Learning**: Build expertise by seeing expert reasoning patterns
- **Confidence**: Trust recommendations backed by transparent logic
- **Compliance**: Document architectural decisions for audits

---

## When to Use Reasoning Integration

### ✅ Required For (Complex Decision-Making)
- **Troubleshooting**: Multi-step diagnostic workflows
- **Architecture Design**: System design decisions with trade-offs
- **Migration Planning**: Risk assessment and sequencing
- **Capacity Planning**: Resource sizing with cost implications
- **Cost Optimization**: Financial decisions requiring justification
- **Security Analysis**: Threat assessment and mitigation strategies
- **Performance Optimization**: Bottleneck analysis and solutions
- **Disaster Recovery**: Failover strategy and RTO/RPO decisions

### ❌ Not Required For (Simple Operations)
- **Simple queries**: "Get AD user info", "List Azure resources"
- **Direct commands**: "Restart service", "Update DNS record"
- **Report generation**: "Export mailbox sizes", "List license assignments"
- **Basic automation**: "Create user account", "Add to group"

### 🤔 Guideline
If a task involves **choosing between alternatives** or **analyzing unknown situations**, use reasoning integration.

---

## How to Integrate Sequential Thinking MCP

### Step 1: Install Sequential Thinking MCP

**From Official MCP Registry**:
```bash
# Install Sequential Thinking MCP server
npm install -g @modelcontextprotocol/server-sequential-thinking

# Add to Claude Code configuration (~/.claude/config.json)
{
  "mcpServers": {
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    }
  }
}
```

**Verify Installation**:
```bash
# Test in Claude Code
/test-mcp sequential-thinking
```

### Step 2: Create Reasoning-Enabled Slash Commands

**Pattern**: Slash command invokes Claude Code with Sequential Thinking MCP enabled

**Example: Reasoning-Enabled AD Troubleshooting Command**

`commands/ad-diagnose.md`:
```markdown
# AD Diagnostic Reasoning Command

Analyzes Active Directory issues using systematic reasoning.

## Usage
/ad-diagnose "[symptom description]"

## Behavior
1. Activates Sequential Thinking MCP for structured analysis
2. Analyzes symptoms systematically:
   - Thought 1: Categorize issue (authentication, replication, GPO, DNS, etc.)
   - Thought 2: Identify relevant subsystems (DC, DNS, Kerberos, LDAP)
   - Thought 3: Generate hypotheses based on symptoms
   - Thought 4: Prioritize hypotheses by likelihood
   - Thought 5: Design validation steps for each hypothesis
3. Executes diagnostic PowerShell commands to test hypotheses
4. Synthesizes findings into actionable recommendations
5. Documents reasoning trace for audit

## Example

User: `/ad-diagnose "Users in Chicago site cannot log in, but New York site works fine"`

Claude Code with Sequential Thinking:
```
Thought 1: Categorize Issue
- Symptom: Site-specific authentication failure (Chicago yes, NY no)
- Scope: Isolated to geographic location → likely infrastructure issue
- Category: Authentication + Site topology

Thought 2: Identify Relevant Subsystems
- Active Directory Sites and Services (replication between sites)
- Domain Controllers (availability in Chicago site)
- DNS (name resolution for Chicago DC)
- Kerberos (authentication ticket flow)
- Network connectivity (Chicago ↔ NY link)

Thought 3: Generate Hypotheses (Prioritized)
1. Chicago DC is down/unreachable (most likely - explains complete failure)
2. Chicago DC replication lagging (possible - would cause password sync issues)
3. Chicago DNS not resolving DC names (possible - clients can't find DC)
4. Site link unavailable (less likely - would affect more than just auth)

Thought 4: Design Validation Steps
→ Hypothesis 1: Check Chicago DC availability
   PowerShell: Test-Connection ChicagoDC01, Get-ADDomainController -Filter {Site -eq "Chicago"}
→ Hypothesis 2: Check replication status
   PowerShell: Get-ADReplicationPartnerMetadata -Target ChicagoDC01
→ Hypothesis 3: Check DNS resolution
   PowerShell: Resolve-DnsName ChicagoDC01.contoso.com -Server ChicagoClient

Thought 5: Execute Diagnostics
[Execute PowerShell commands above]

Thought 6: Analyze Results
- ChicagoDC01 responds to ping: ✓
- AD Domain Controller service: ✗ STOPPED
- Replication status: Cannot connect
→ ROOT CAUSE: Chicago DC's AD service is stopped

Thought 7: Recommend Fix
Immediate: Start-Service NTDS on ChicagoDC01
Follow-up: Investigate why service stopped, enable monitoring
```

→ **Outcome**: Clear diagnostic reasoning + actionable fix + audit trail
```

## Integration

Uses Sequential Thinking MCP to:
- Structure diagnostic thinking process
- Test hypotheses systematically
- Document decision rationale
- Provide audit trail for compliance

Uses PowerShell Active Directory module to:
- Query domain controller status
- Check replication health
- Test connectivity
- Diagnose authentication issues
```

### Step 3: Create Specialized Reasoning Agents

**Pattern**: AI agent persona with domain expertise + reasoning framework

**Example: AD Troubleshooting Reasoner Agent**

`agents/ad-diagnostics-agent.md`:
```markdown
# AD Diagnostics Reasoning Agent

## Role
Specialized AI agent for Active Directory troubleshooting using systematic diagnostic reasoning.

## Expertise
- Active Directory infrastructure (sites, replication, GPO, DNS, trusts)
- Windows Server authentication (Kerberos, NTLM, LDAP)
- PowerShell AD module cmdlets
- AD diagnostic tools (dcdiag, repadmin, nltest)
- Common AD failure patterns and resolutions

## Reasoning Framework

When analyzing AD issues, I use Sequential Thinking to:

1. **Symptom Analysis** (Thought 1-2)
   - Parse user-reported symptoms
   - Identify affected components
   - Determine scope (user/site/domain/forest)

2. **Hypothesis Generation** (Thought 3-4)
   - Generate possible root causes based on symptoms
   - Prioritize by likelihood using AD failure patterns
   - Consider recent changes or known issues

3. **Diagnostic Planning** (Thought 5-6)
   - Design validation steps for each hypothesis
   - Identify required PowerShell cmdlets/tools
   - Plan diagnostic sequence (least to most invasive)

4. **Evidence Collection** (Thought 7-8)
   - Execute diagnostic commands
   - Analyze command outputs
   - Update hypothesis probabilities

5. **Root Cause Identification** (Thought 9-10)
   - Synthesize evidence into root cause
   - Validate conclusion against all symptoms
   - Document reasoning chain

6. **Solution Recommendation** (Thought 11-12)
   - Propose immediate fix
   - Identify preventive measures
   - Estimate impact and risks

## System Prompt

You are an Active Directory infrastructure expert specializing in systematic troubleshooting. When analyzing AD issues:

**Always use Sequential Thinking MCP** to structure your diagnostic process. Make your reasoning transparent:
- State assumptions explicitly
- Generate multiple hypotheses before testing
- Document why you prioritize certain diagnostics
- Explain how evidence supports or refutes hypotheses
- Justify recommendations with reasoning chain

**Your diagnostic approach**:
1. Understand the symptom completely before jumping to solutions
2. Consider site topology, replication, DNS, and authentication stack
3. Use PowerShell AD module as primary diagnostic tool
4. Think systematically through subsystems (DC → DNS → Replication → Auth → GPO)
5. Document your reasoning for audit and learning

**Commands you leverage**:
- Get-ADDomainController, Get-ADReplicationPartnerMetadata
- Test-ComputerSecureChannel, Get-ADUser, Get-ADComputer
- Resolve-DnsName, dcdiag, repadmin, nltest
- Get-EventLog (Directory Services, DNS, System)

**Output format**:
1. Reasoning trace (Sequential Thinking thoughts)
2. Diagnostic command execution
3. Root cause explanation
4. Recommended fix with rationale
5. Preventive measures

## Example Interaction

User: "AD replication failing between DC1 and DC2, error 8606"

Agent with Sequential Thinking:
```
Thought 1: Parse Error Code
- Error 8606: "Insufficient attributes were given to create an object"
- Context: Replication between two DCs
- Typical cause: Missing or incomplete schema/object definitions

Thought 2: Replication Architecture
- Source: DC1, Destination: DC2
- Direction: Need to identify which direction failing (DC1→DC2 or DC2→DC1)
- Partition: Which partition? (Schema, Config, Domain, or Application)

Thought 3: Hypothesis Generation
1. Incomplete schema replication (most likely for error 8606)
2. Corrupt object in replication queue
3. Permission issue on destination DC
4. NTDS database corruption

Thought 4: Diagnostic Plan
→ Check replication status both directions
→ Identify failing partition
→ Examine replication queue for corrupt objects
→ Validate NTDS database integrity

[Continue with detailed diagnostic steps...]
```

## Integration with Other Tools

This agent integrates with:
- **sequential-thinking-integration**: Core reasoning capability
- **ad-health-monitor**: Proactive monitoring data
- **replication-topology-analyzer**: Topology context
- **PowerShell AD Module**: Diagnostic execution

## Usage

This agent is automatically activated by:
- `/ad-diagnose` command
- `/ad-recover` command
- Any slash command in `ad-troubleshooting-reasoner` plugin

Can be manually invoked:
```
@ad-diagnostics-agent analyze "replication error 8606 between DC1 and DC2"
```
```

### Step 4: Document Reasoning in README

**Every reasoning-enabled plugin README must include**:

```markdown
## Reasoning Integration

This tool uses Sequential Thinking MCP for transparent decision-making.

### When Reasoning Activates
[Describe scenarios where reasoning is used]

### Reasoning Process
[Outline the typical reasoning flow]

### Example Reasoning Trace
[Show actual Sequential Thinking output]

### Audit Trail
[Explain how reasoning traces are logged/saved for compliance]
```

---

## Reasoning Patterns by Domain

### Active Directory Troubleshooting
**Reasoning Flow**:
1. Symptom categorization (auth, replication, GPO, DNS, trust)
2. Subsystem identification (DC, DNS, Kerberos, LDAP, Sites)
3. Hypothesis generation (prioritized by symptom pattern)
4. Validation planning (diagnostic commands)
5. Evidence analysis (command outputs)
6. Root cause determination
7. Solution recommendation (immediate + preventive)

**Example Tools**: ad-troubleshooting-reasoner, ad-health-monitor

### Exchange Mail Flow Analysis
**Reasoning Flow**:
1. Mail flow symptom analysis (internal/external, direction, sender/recipient pattern)
2. Mail flow component identification (transport, connectors, rules, agents)
3. Hypothesis generation (connector, rule, DNS, certificate, throttling)
4. Message tracking analysis (trace message path)
5. Transport rule evaluation (rule precedence and matching)
6. Root cause identification
7. Fix recommendation (configuration change, rule adjustment)

**Example Tools**: mail-flow-troubleshooter, exchange-mailflow-analyzer

### M365 Licensing Optimization
**Reasoning Flow**:
1. Current license inventory analysis (assigned, available, usage)
2. Usage pattern analysis (feature utilization, inactive users)
3. Cost structure understanding (per-license costs, commitment levels)
4. Optimization hypothesis generation (consolidation, downgrade, eliminate)
5. Impact assessment (feature loss, user disruption, compliance)
6. Cost-benefit analysis (savings vs impact)
7. Recommendation (specific license changes with ROI calculation)

**Example Tools**: m365-licensing-optimizer, m365-licensing-optimizer-reasoner

### Azure Resource Planning
**Reasoning Flow**:
1. Workload requirements analysis (performance, availability, cost)
2. Azure service option evaluation (VM vs App Service vs Functions vs Containers)
3. Sizing analysis (compute, memory, storage requirements)
4. Architecture pattern selection (monolith, microservices, serverless)
5. Cost projection (different service/size combinations)
6. Trade-off analysis (cost vs performance vs complexity)
7. Architecture recommendation (services, sizing, estimated cost, rationale)

**Example Tools**: azure-resource-planner-reasoner, capacity-planning-toolkit

### Capacity Planning
**Reasoning Flow**:
1. Current usage baseline (metrics, growth trends)
2. Workload forecast (user growth, feature additions, seasonal patterns)
3. Performance requirements (SLA targets, response times)
4. Resource model (capacity per unit, scaling patterns)
5. Constraint identification (budget, hardware lead time, licensing)
6. Scenario modeling (conservative, expected, aggressive growth)
7. Capacity recommendation (timeline, quantities, contingency, cost)

**Example Tools**: capacity-planning-toolkit, capacity-planning-reasoner

---

## Best Practices

### 1. Start Reasoning Early
Don't jump to solutions. Use thoughts 1-3 to fully understand the problem before proposing fixes.

**❌ Bad**:
```
Thought 1: The solution is to restart the service
→ Execute: Restart-Service NTDS
```

**✅ Good**:
```
Thought 1: Analyze symptom pattern - authentication failing intermittently
Thought 2: Identify affected scope - only users in Site B
Thought 3: Hypothesis: Site B DC having performance issues vs offline vs replication lag
Thought 4: Validate by checking DC availability and performance
→ [After validation] Conclusion: DC is up but high CPU due to inefficient query
→ Solution: Optimize query, not restart service
```

### 2. Generate Multiple Hypotheses
Don't commit to first idea. Consider alternatives to avoid confirmation bias.

**✅ Pattern**:
```
Thought 3: Generate Hypotheses
1. DC service stopped (probability: 30%)
2. DNS resolution failing (probability: 25%)
3. Replication lag causing password sync issues (probability: 25%)
4. Network connectivity issue (probability: 15%)
5. Kerberos ticket expiration (probability: 5%)
```

### 3. Document "Why Not" Decisions
Explain why alternatives were rejected.

**✅ Pattern**:
```
Thought 7: Why Not Use Virtual Machines?
- VMs would work technically but add management overhead
- Considered: Azure VMs vs App Service
- Decision: App Service because:
  - Eliminates OS patching burden
  - Built-in scaling and load balancing
  - 40% lower cost for this workload
  - Team has PaaS expertise, less VM experience
```

### 4. Make Assumptions Explicit
State what you're assuming to make reasoning auditable.

**✅ Pattern**:
```
Thought 2: Assumptions
- Assuming standard AD site topology (no unusual configurations)
- Assuming recent Windows Server 2019+ (supports modern replication)
- Assuming no recent schema changes (no recent Exchange/SCCM deployments)
If any assumption invalid, diagnostic approach may need adjustment.
```

### 5. Quantify When Possible
Use numbers to make reasoning concrete and verifiable.

**✅ Pattern**:
```
Thought 5: Capacity Calculation
- Current: 50 users, 2 GB mailbox average = 100 GB total
- 12-month forecast: 75 users (+50% growth)
- Projected: 75 users * 2 GB = 150 GB (+50 GB growth)
- With 20% buffer: 180 GB required
- Current capacity: 200 GB
→ Conclusion: No additional storage needed for 12 months
```

### 6. End with Actionable Recommendations
Conclude reasoning with concrete next steps.

**✅ Pattern**:
```
Thought 12: Recommendations
Immediate Actions:
1. Restart AD DS service on ChicagoDC01 (2 minutes, low risk)
2. Monitor authentication success rate (should return to 100%)
3. Review ChicagoDC01 System event log for service crash cause

Follow-up Actions:
1. Implement DC health monitoring alerts (prevent future outages)
2. Configure service recovery (auto-restart AD DS service)
3. Review DC resource utilization (CPU/memory/disk) to identify root cause of service failure

Timeline: Immediate fix now, monitoring setup within 24 hours, root cause analysis within 1 week
```

---

## Integration Testing

### Verify Reasoning Integration Works

**Test 1: Sequential Thinking MCP Activation**
```bash
# Ensure Sequential Thinking MCP is available
/test-mcp sequential-thinking

# Expected: MCP server responds with available tools
```

**Test 2: Slash Command Triggers Reasoning**
```bash
# Execute reasoning-enabled command
/ad-diagnose "test symptom"

# Expected: See "Thought 1:", "Thought 2:", etc. in output
```

**Test 3: Agent Uses Reasoning Framework**
```bash
# Invoke reasoning agent
@ad-diagnostics-agent analyze "test scenario"

# Expected: Structured reasoning with hypotheses and validation
```

**Test 4: Reasoning Trace Saved**
```bash
# After reasoning command execution
ls -la ~/.claude/reasoning-traces/

# Expected: Reasoning trace log file created with timestamp
```

---

## Troubleshooting Reasoning Integration

### Issue: No Reasoning Output, Just Direct Answers

**Cause**: Sequential Thinking MCP not activated

**Solution**:
```bash
# Verify MCP server configured
cat ~/.claude/config.json | grep sequential-thinking

# Restart Claude Code to reload MCP servers
/restart

# Test MCP activation
/test-mcp sequential-thinking
```

### Issue: Reasoning Too Verbose/Long

**Solution**: Adjust thinking depth in command
```markdown
# In slash command:
Use Sequential Thinking with 5-7 thoughts maximum for structured analysis.
Focus on: symptom → hypothesis → validation → recommendation.
```

### Issue: Reasoning Doesn't Match Domain Expertise

**Solution**: Enhance agent system prompt with domain patterns
```markdown
# In agent definition:
When troubleshooting AD replication, always follow this diagnostic sequence:
1. Check DC availability (Test-Connection)
2. Verify DNS resolution (Resolve-DnsName)
3. Check replication metadata (Get-ADReplicationPartnerMetadata)
4. Examine event logs (Get-EventLog Application -Source "NTDS Replication")
5. Test secure channel (Test-ComputerSecureChannel)
```

---

## Examples from Marketplace

### Example 1: sequential-thinking-integration
**File**: `1-reasoning-foundation/sequential-thinking-integration/`
- Provides slash commands: `/reasoning-troubleshoot`, `/reasoning-design`, `/reasoning-analyze`
- Core reasoning capability for all other plugins
- Shows basic reasoning integration pattern

### Example 2: ad-troubleshooting-reasoner
**File**: `1-reasoning-foundation/ad-troubleshooting-reasoner/`
- Specialized AD diagnostic reasoning
- Combines Sequential Thinking with AD domain knowledge
- Shows domain-specific reasoning pattern

### Example 3: mail-flow-troubleshooter
**File**: `3-exchange-messaging/mail-flow-troubleshooter/`
- Exchange mail flow diagnostics with reasoning
- Shows multi-component analysis reasoning pattern

### Example 4: capacity-planning-toolkit
**File**: `6-infrastructure-architecture/capacity-planning-toolkit/`
- Capacity forecasting with reasoning
- Shows quantitative analysis reasoning pattern

---

## Additional Resources

- [Sequential Thinking MCP Documentation](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking)
- [Model Context Protocol Specification](https://github.com/modelcontextprotocol/specification)
- [Claude Code MCP Integration Guide](https://docs.claude.com/en/docs/claude-code/mcp)
- [Marketplace Quality Standards](../QUALITY_STANDARDS.md) - Reasoning requirements for Tier 1 plugins

---

**Questions or need help with reasoning integration?** Open a [GitHub Discussion](https://github.com/your-username/ad-messaging-marketplace/discussions) with tag `reasoning-integration`.
