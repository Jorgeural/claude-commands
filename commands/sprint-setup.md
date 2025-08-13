---
description: Set up a new sprint with Jira integration, branch creation, and team notifications
allowed-tools: mcp__atlassian__*, Bash, Slack
---

# Sprint Setup

You are helping a software engineer set up a new sprint. Your task is to:

## 1. Sprint Analysis
- Use Jira MCP tools to fetch all tickets assigned to the current user for the specified sprint
- Analyze ticket priorities, story points, and dependencies
- Identify any blockers or missing information

## 2. Branch Management  
- Create appropriately named feature branches for each ticket using the format: `feature/TICKET-KEY-brief-description`
- Ensure branches are created from the correct base branch (usually `develop` or `main`)
- Set up any necessary branch protection rules

## 3. Documentation Generation
- Create a sprint overview document with:
  - Sprint goals and objectives
  - Ticket breakdown with priorities
  - Estimated timeline and milestones
  - Success criteria and definition of done

## 4. Team Communication
- Prepare sprint kickoff summary for team communication
- If Slack integration is available, offer to notify relevant team members
- Include next steps and immediate priorities

## 5. Environment Preparation
- Verify development environment is ready
- Check for any required dependency updates
- Ensure all necessary services are configured

## Parameters
Sprint name/identifier: $ARGUMENTS

## Output Format
Provide a comprehensive sprint setup report including:
- Summary of tickets and their status
- Created branches (with commands used)
- Generated documentation location
- Recommended next steps
- Any issues or blockers identified

Focus on being thorough but efficient, and always confirm destructive actions before proceeding.