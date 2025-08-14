# Claude Commands for Software Engineers

A comprehensive collection of custom Claude slash commands designed specifically for software engineers. These commands leverage MCP (Model Context Protocol) integrations with popular development tools to streamline common engineering workflows.

> **📖 Project Background**: This repository emerged from our team's proof-of-concept exploration into custom Claude Code slash commands. The initiative began with a simple need: consistent session documentation for AI-assisted development workflows. What started as a single `/document-session` command evolved into a comprehensive collection of workflow automation tools. Read the complete story and insights in our [POC documentation](POC-slash-commands.md).

## 🚀 What are Claude Slash Commands?

Claude slash commands are reusable prompts that can be invoked with a simple `/command-name` syntax in Claude Code. They enable you to:

- **Automate repetitive tasks** - Turn complex multi-step processes into single commands
- **Leverage integrations** - Use MCP tools like Jira, GitHub, Confluence, Slack, and more
- **Maintain consistency** - Standardize workflows across your team
- **Save time** - Execute complex analyses and operations with simple commands

For more information about Claude slash commands, visit the [official documentation](https://docs.anthropic.com/en/docs/claude-code/slash-commands).

## 📦 Available Commands

This repository includes **10 production-ready commands** covering major software engineering workflows:

### 🔧 Development Workflow

- **`/sprint-setup`** - Set up sprints with Jira integration, branch creation, and team notifications
- **`/pr-ready`** - Comprehensive pre-PR checklist and preparation _(coming soon)_
- **`/deploy-check`** - Validate deployment readiness _(coming soon)_

### 🐛 Debugging & Monitoring

- **`/error-analysis`** - Analyze error patterns from Sentry and suggest fixes
- **`/debug-session`** - Set up debugging environment with context _(coming soon)_

### 📋 Project Management

- **`/epic-breakdown`** - Break down large epics into manageable tasks with estimation
- **`/ticket-estimate`** - AI-powered story point estimation _(coming soon)_

### 🤝 Team Collaboration

- **`/knowledge-share`** - Extract and share technical knowledge across platforms
- **`/code-handoff`** - Create comprehensive knowledge transfer documentation _(coming soon)_

### 🏗️ Architecture & Design

- **`/design-review`** - Create implementation plans from Figma designs
- **`/api-design`** - Design and document APIs comprehensively _(coming soon)_

### 🔍 Code Quality

- **`/security-audit`** - Comprehensive security analysis of codebase and dependencies
- **`/refactor-plan`** - Analyze code and create refactoring roadmap _(coming soon)_

### 📦 Build & Deployment

- **`/build-optimize`** - Analyze and optimize build process performance
- **`/env-sync`** - Synchronize environment configurations _(coming soon)_

### 📊 Analytics & Reporting

- **`/velocity-report`** - Generate team velocity and productivity metrics
- **`/commit-analysis`** - Analyze commit patterns and code ownership _(coming soon)_

### 🔄 Integration & Automation

- **`/ci-health`** - Monitor and optimize CI/CD pipeline health
- **`/workspace-setup`** - Set up complete development workspace _(coming soon)_

### 📝 Documentation & Session Management

- **`/document-session`** - Generate structured session documentation with TL;DR summaries

## 💡 All Command Ideas

For a complete list of all 34 planned commands with detailed descriptions, see [Ideas.md](Ideas.md).

## 🛠️ MCP Tool Integrations

These commands are designed to work with the following MCP integrations:

- **🎫 Jira** - Project management, sprint planning, ticket tracking
- **💻 GitHub** - Code analysis, repository management, pull requests
- **📖 Confluence** - Documentation creation and knowledge management
- **💬 Slack** - Team communication and notifications
- **🗄️ Google Drive** - Document storage and sharing
- **🎨 Figma** - Design analysis and specifications
- **📦 Maven** - Dependency management and build optimization
- **🔍 Sentry** - Error monitoring and debugging
- **⚙️ CircleCI** - CI/CD pipeline analysis and optimization

## ⚡ Quick Start

### Installation

1. **Clone this repository:**

   ```bash
   git clone <repository-url>
   cd claude-commands
   ```

2. **Run the installation script:**

   **Interactive Mode** (choose all or single command):

   ```bash
   ./scripts/install-commands.sh
   ```

   **Install All Commands:**

   ```bash
   ./scripts/install-commands.sh
   # Then select option "0" for all commands
   ```

   **Install Single Command:**

   ```bash
   ./scripts/install-commands.sh sprint-setup
   # Or use interactive mode and select specific command
   ```

3. **Follow the prompts** to complete installation to `~/.claude/commands`

### Uninstallation

The repository also includes a comprehensive uninstall script:

**Interactive Mode** (choose what to remove):

```bash
./scripts/uninstall-commands.sh
```

**Remove Single Command:**

```bash
./scripts/uninstall-commands.sh sprint-setup
```

**Uninstall Features:**

- ✅ **Safety-first**: Only removes commands from this repository (protects other custom commands)
- ✅ Remove all repository commands or individual selection
- ✅ Automatic backup before removal
- ✅ Clear summary of what was removed
- ✅ Interactive menu with command descriptions
- ✅ Confirmation prompts for all operations

The installer will:

- ✅ Create the `~/.claude/commands` directory if it doesn't exist
- ✅ Show interactive menu with all available commands and descriptions
- ✅ Allow installation of all commands or individual command selection
- ✅ Handle conflicts with existing commands (with options to overwrite, skip, or rename)
- ✅ Create backups of existing commands before installation
- ✅ Provide detailed feedback on what was installed

### Installation Options

| Command                                | Description                                                                 |
| -------------------------------------- | --------------------------------------------------------------------------- |
| `./scripts/install-commands.sh`                | Interactive mode - shows menu to select all commands or individual commands |
| `./scripts/install-commands.sh [command-name]` | Direct installation of a specific command (e.g., `sprint-setup`)            |

### Uninstallation Options

| Command                                  | Description                                                                                      |
| ---------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `./scripts/uninstall-commands.sh`                | Interactive mode - shows menu of repository commands available for removal |
| `./scripts/uninstall-commands.sh [command-name]` | Direct removal of a specific repository command (e.g., `sprint-setup`)                                      |

**Uninstall Safety Features:**

- **Repository Commands Only**: Only removes commands that originated from this claude-commands repository
- **Command Protection**: Other custom commands you may have installed remain untouched
- **Clear Identification**: Shows which commands are from this repo with descriptions
- **Backup Protection**: Automatic backup created before any removal operation

**Interactive Menu Example:**

```
Available commands:

0) Install ALL commands (10 total)
1) /sprint-setup - Set up a new sprint with Jira integration, branch creation, and team notifications
2) /error-analysis - Analyze error patterns from Sentry and suggest fixes based on stack traces and trends
3) /epic-breakdown - Break down large Jira epics into manageable tasks with effort estimation and technical specifications
4) /knowledge-share - Extract technical knowledge from code and create shareable documentation for team collaboration
5) /design-review - Create architecture review checklist from Figma designs and generate technical implementation plans
6) /security-audit - Perform comprehensive security analysis of codebase, dependencies, and runtime errors
7) /build-optimize - Analyze and optimize build process performance, identifying bottlenecks and implementing improvements
8) /velocity-report - Generate comprehensive team velocity and productivity metrics from Jira and GitHub data
9) /ci-health - Monitor and optimize CI/CD pipeline health, identifying failures and performance issues
10) /document-session - Generate structured session documentation with TL;DR summaries

Select option (0-10):
```

### Usage

Once installed, use the commands in Claude Code with the `/` prefix:

```bash
# Set up a new sprint
/sprint-setup SPRINT-2024-Q1

# Analyze recent errors
/error-analysis 7d --severity=high

# Break down an epic
/epic-breakdown PROJ-123 --include-designs

# Generate velocity report
/velocity-report backend-team --period=quarterly

# Perform security audit
/security-audit --scope=all --severity=critical

# Share technical knowledge
/knowledge-share jwt-authentication --format=confluence

# Review design implementation
/design-review https://figma.com/file/abc123

# Optimize build performance
/build-optimize --target=maven --implement-fixes

# Check CI/CD health
/ci-health --timeframe=30d --fix-issues

# Document current session
/document-session debugging-session --path=./sessions
```

### Configuration

Most commands work out of the box, but you can enhance them by:

1. **Setting up MCP integrations** in your Claude configuration
2. **Configuring tool access tokens** (Jira, GitHub, etc.)
3. **Customizing command parameters** in the command files

## 📁 Repository Structure

```
claude-commands/
├── README.md                 # This file
├── Ideas.md                 # Complete list of all command ideas
├── Instructions.md          # Original development instructions
├── scripts/                 # Installation and management scripts
│   ├── install-commands.sh   # Installation script
│   └── uninstall-commands.sh # Uninstallation script
├── commands/                # Command definitions (10 commands)
│   ├── sprint-setup.md      # Development workflow
│   ├── error-analysis.md    # Debugging & monitoring
│   ├── epic-breakdown.md    # Project management
│   ├── knowledge-share.md   # Team collaboration
│   ├── design-review.md     # Architecture & design
│   ├── security-audit.md    # Code quality
│   ├── build-optimize.md    # Build & deployment
│   ├── velocity-report.md   # Analytics & reporting
│   ├── ci-health.md         # Integration & automation
│   └── document-session.md  # Documentation & session management
├── templates/               # Command and session templates
│   ├── command.md           # Template for creating new commands
│   └── session.md           # Session template
└── sessions/                # Session examples
```

## 🔧 Customization

### Creating New Commands

1. Create a new `.md` file in the `commands/` directory
2. Use the template structure from `templates/command.md`
3. Test the command locally
4. Run `./scripts/install-commands.sh` to deploy

### Modifying Existing Commands

1. Edit the command file in the `commands/` directory
2. Re-run the installation script to update your local commands
3. The installer will detect changes and offer to update existing commands

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **Add new commands** - See [Ideas.md](Ideas.md) for inspiration
2. **Improve existing commands** - Enhance prompts, add features, fix issues
3. **Add MCP integrations** - Extend commands to use additional tools
4. **Documentation** - Improve README, add examples, create tutorials
5. **Testing** - Try commands with different scenarios and report issues

### Development Workflow

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-command`
3. Add or modify commands
4. Test your changes locally
5. Update documentation if needed
6. Submit a pull request

## 📖 Examples

### Command Management Examples

**Installing Commands:**

```bash
# Install everything interactively
./scripts/install-commands.sh

# Install just the sprint-setup command
./scripts/install-commands.sh sprint-setup

# Install multiple specific commands (interactive selection)
./scripts/install-commands.sh  # Then choose individual selection
```

**Removing Commands:**

```bash
# Interactive uninstall menu
./scripts/uninstall-commands.sh

# Remove specific command
./scripts/uninstall-commands.sh error-analysis

# Remove all repository commands (other commands remain safe)
./scripts/uninstall-commands.sh  # Then select "Remove ALL repository commands"
```

### Command Usage Examples

#### Sprint Setup Example

```bash
/sprint-setup PROJ-SPRINT-15
```

**Output:**

- Fetches all assigned Jira tickets
- Creates feature branches for each ticket
- Generates sprint documentation
- Provides next steps and priorities

#### Error Analysis Example

```bash
/error-analysis 7d --severity=high
```

**Output:**

- Analysis of error patterns from the last 7 days
- Root cause identification for high-severity issues
- Specific fix recommendations with code examples
- Prioritized action plan

#### Security Audit Example

```bash
/security-audit --scope=dependencies --severity=critical
```

**Output:**

- Comprehensive dependency vulnerability scan
- Critical security issues with CVSS scores
- Specific remediation steps
- Compliance assessment

## ❓ FAQ

**Q: Do I need special permissions to use these commands?**
A: You'll need appropriate MCP tool access (Jira, GitHub, etc.) configured in Claude Code.

**Q: Can I use these commands without MCP integrations?**
A: Yes! Commands gracefully fallback to working with local files and user-provided data.

**Q: How do I update commands when new versions are released?**
A: Simply run `./scripts/install-commands.sh` again. It will detect updates and offer to replace existing commands.

**Q: How do I remove commands I no longer need?**
A: Use the uninstall script: `./scripts/uninstall-commands.sh`. It safely removes only commands from this repository, protecting any other custom commands you have.

**Q: Can I modify commands for my team's specific needs?**
A: Absolutely! Edit the command files and re-run the installer.

**Q: What happens if I accidentally remove commands?**
A: The uninstall script automatically creates backups before removal. You can restore from the backup location shown in the output.

**Q: Are there any security considerations?**
A: Commands are designed with security in mind and will ask for confirmation before making changes.

## 🛡️ Security

- Commands never expose sensitive information in outputs
- Confirmation required for destructive operations
- MCP tool access respects your existing permissions
- Local backups created before any changes

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙋‍♂️ Support

- **Issues**: Report bugs and request features via GitHub Issues
- **Discussions**: Ask questions and share ideas in GitHub Discussions
- **Documentation**: Check the [Claude Code documentation](https://docs.anthropic.com/en/docs/claude-code)

---

**Built with ❤️ for the software engineering community**

_Streamline your development workflow with the power of Claude and MCP integrations._
