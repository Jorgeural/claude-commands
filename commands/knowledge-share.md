---
description: Extract technical knowledge from code and create shareable documentation for team collaboration
allowed-tools: Read, Write, mcp__atlassian__*, Bash
---

# Knowledge Share

You are helping a software engineer extract and share technical knowledge with their team. Your task is to:

## 1. Knowledge Extraction
- Analyze the specified code, feature, or recent changes to understand the implementation
- Identify key technical concepts, patterns, and architectural decisions
- Extract important design considerations and trade-offs made

## 2. Content Analysis
- Understand the business context and technical problem being solved
- Identify reusable patterns and components that others can leverage
- Recognize potential learning opportunities and best practices

## 3. Documentation Creation
- Generate comprehensive technical documentation explaining the implementation
- Include code examples, diagrams, and explanatory text where helpful
- Structure content for easy consumption by team members with varying expertise levels

## 4. Multi-Platform Publishing
- Create content suitable for different platforms (Confluence, GitHub, Slack)
- Adapt the format and detail level for each platform's audience
- If Confluence MCP is available, offer to create detailed technical pages

## 5. Knowledge Transfer
- Generate common questions and answers based on the implementation
- Identify team members who would benefit from this knowledge
- Create actionable next steps for knowledge dissemination

## 6. Future Reference
- Organize knowledge in a searchable, maintainable format
- Link related documentation and resources
- Set up mechanisms for keeping documentation updated

## Parameters
Topic, file path, or focus area: $ARGUMENTS (e.g., "jwt-auth" or "src/auth/service.ts" or "--format=confluence")

## Output Format
Provide comprehensive knowledge sharing package including:
- Technical summary suitable for different audiences
- Detailed implementation guide with examples
- Common Q&A based on the complexity and potential questions
- Recommendations for team distribution and follow-up
- Links to related resources and documentation

Focus on making complex technical concepts accessible while maintaining technical accuracy.