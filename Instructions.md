# Claude Commands Repository Setup Instructions

Hey Claude, this is a repository for storing custom Claude slash commands, along with a script to easily install them in the ~/.claude/commands folder.

## IMPORTANT: What We're Creating

**Claude slash commands are .md files that define reusable prompts/workflows** - NOT execution results. Each command file contains instructions for Claude on how to help with a specific task.

Use the template structure from `templates/command.md` when creating new commands.

## Step 1: Create Ideas.md

Create a comprehensive list of custom slash command IDEAS, following these guidelines:

- **Target Audience**: Software Engineers
- **Focus Areas**: Software development, programming languages, and development tools
- **Available MCP Tools**: GitHub, Jira, Confluence, Slack, Google Drive, Figma, Maven, Sentry, CircleCI
- **Command Categories**: Organize by workflow type (e.g., Development, Debugging, Project Management, etc.)
- **Command Purpose**: Each idea should solve a real engineering workflow problem

**Output**: Create Ideas.md with 30+ command ideas organized by category

## Step 2: Create Command Templates

After Ideas.md is reviewed, create actual Claude slash command template files (.md) in the `/commands` folder:

- **Format**: Each command is a .md file that tells Claude HOW to help with a task
- **Not Results**: Commands are instructions/prompts, NOT the output of executing those instructions
- **Structure**: Use proper frontmatter with description and allowed-tools
- **Scope**: Create one example command from each major category (8-10 commands total)
- **MCP Integration**: Leverage available tools appropriately in each command

**Output**: 8-10 working command template files in `/commands/` directory

## Step 3: Installation Script

Create `install-commands.sh` script with these features:

- **Target Directory**: ~/.claude/commands
- **Safety Features**: 
  - Create directory if it doesn't exist
  - Backup existing commands before installation
  - Handle conflicts with user choice (overwrite/skip/rename)
  - Colorful, interactive feedback
- **Error Handling**: Robust error checking and user guidance
- **User Experience**: Clear progress indicators and success/failure messages

**Output**: Executable installation script with comprehensive conflict handling

## Step 4: Documentation

Create comprehensive README.md covering:

- **Slash Commands Explanation**: What they are and how they work (reference: https://docs.anthropic.com/en/docs/claude-code/slash-commands)
- **Available Commands**: Catalog of included commands with descriptions
- **Installation Guide**: Step-by-step setup instructions
- **Usage Examples**: Real-world usage scenarios for each command
- **Customization**: How to modify and create new commands
- **MCP Integration**: How commands leverage available tools
- **Contributing**: Guidelines for extending the repository

**Output**: Professional README.md with complete documentation

## Step 5: Repository Summary

Provide a comprehensive summary including:
- **What was built**: Complete inventory of deliverables
- **Repository purpose**: Target audience and use cases
- **Key features**: Highlights of functionality and benefits
- **Usage scenarios**: When and how teams would use this

## Completed Status (✅ = Done)

- ✅ Ideas.md with 34 command ideas across 9 categories
- ✅ 9 working command templates (one from each category)
- ✅ Robust installation script with conflict handling
- ✅ Comprehensive README.md with full documentation
- ✅ Repository summary and purpose statement

## Reference Resources

Some inspirational repositories that you can check out for ideas:
https://github.com/brennercruvinel/CCPlugins
https://github.com/fcakyon/claude-settings
