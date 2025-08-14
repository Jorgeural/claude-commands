# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Claude Commands repository that provides custom slash commands for software engineers. The repository contains:

- **Custom slash command definitions**: Located in `commands/` directory as markdown files
- **Installation/uninstallation scripts**: `install-commands.sh` and `uninstall-commands.sh`
- **Command ideas and documentation**: `Ideas.md` and comprehensive `README.md`

## Project Structure

```
claude-commands/
├── README.md                 # Complete documentation and usage guide
├── Ideas.md                  # 34+ command ideas organized by category
├── Instructions.md           # Development instructions for command creation
├── install-commands.sh       # Interactive installation script
├── uninstall-commands.sh     # Interactive uninstallation script
├── commands/                 # Command definitions (9 working commands)
│   ├── sprint-setup.md       # Sprint initialization with Jira integration
│   ├── error-analysis.md     # Error pattern analysis using Sentry
│   ├── epic-breakdown.md     # Break down large epics into tasks
│   ├── knowledge-share.md    # Technical knowledge documentation
│   ├── design-review.md      # Implementation plans from Figma designs
│   ├── security-audit.md     # Comprehensive security analysis
│   ├── build-optimize.md     # Build process optimization
│   ├── velocity-report.md    # Team productivity metrics
│   └── ci-health.md          # CI/CD pipeline monitoring
└── sessions/                 # Session templates and examples
```

## Command Development

### Command Structure
Each command file follows this format:
```markdown
---
description: Brief description of what the command does
allowed-tools: Tool1, Tool2, Bash, Read, Write
---

# Command Name
[Command instructions for Claude...]
```

### MCP Tool Integrations
Commands leverage these MCP tools:
- **mcp__atlassian__***: Jira and Confluence integration
- **GitHub tools**: Repository and code analysis
- **Slack**: Team communication
- **Sentry**: Error monitoring and analysis
- **CircleCI**: CI/CD pipeline management
- **Figma**: Design analysis
- **Maven**: Dependency management

## Common Development Tasks

### Installation and Management
```bash
# Install all commands interactively
./install-commands.sh

# Install specific command
./install-commands.sh sprint-setup

# Uninstall commands (interactive)
./uninstall-commands.sh

# Uninstall specific command
./uninstall-commands.sh error-analysis
```

### Creating New Commands
1. Study existing commands in `commands/` directory
2. Use the template structure from `Instructions.md:10-31`
3. Define appropriate MCP tools in frontmatter
4. Test locally then run `./install-commands.sh`

### Testing Commands
Commands are tested by:
1. Installing to `~/.claude/commands`
2. Using in Claude Code with `/command-name` syntax
3. Verifying MCP tool integration works correctly

## Repository Architecture

This is a **command definition repository**, not an executable application. The architecture focuses on:

1. **Command Templates**: Markdown files with structured prompts for Claude
2. **Installation System**: Bash scripts with conflict handling and backups
3. **Documentation**: Comprehensive guides for usage and development
4. **Command Categories**: Organized by workflow (Development, Debugging, Project Management, etc.)

## Key Design Patterns

### Command Categories (9 main categories)
- Development Workflow
- Debugging & Monitoring  
- Project Management
- Team Collaboration
- Architecture & Design
- Code Quality
- Build & Deployment
- Analytics & Reporting
- Integration & Automation

### Installation Script Features
- Interactive menu selection
- Conflict resolution with backup
- Individual or bulk installation
- Colored output and progress tracking
- Comprehensive error handling

### Uninstallation Script Features
- Repository commands vs other commands distinction
- Individual selection with multi-choice
- Automatic backup before removal
- Restoration instructions provided

## Usage Notes

- Commands are prompt templates, not executable code
- Target directory: `~/.claude/commands`
- Each command integrates with specific MCP tools
- Commands gracefully degrade when tools aren't available
- All operations include confirmation prompts for safety