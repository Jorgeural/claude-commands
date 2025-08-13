---
description: Analyze error patterns from Sentry and suggest fixes based on stack traces and trends
allowed-tools: mcp__atlassian__*, Read, Write, Bash
---

# Error Analysis

You are helping a software engineer analyze application errors and identify patterns. Your task is to:

## 1. Error Data Collection
- If Sentry integration is available, fetch recent errors for the specified time period
- Otherwise, analyze error logs from application files or ask user to provide error data
- Focus on the severity level specified in arguments (default: all levels)

## 2. Pattern Analysis
- Identify the most frequent error types and their occurrence patterns
- Analyze error trends over time (increasing, decreasing, or stable)
- Group similar errors by stack trace similarity and root cause

## 3. Impact Assessment
- Assess the business impact of each error type
- Consider factors like user experience, functionality breakage, and frequency
- Prioritize errors by severity and impact

## 4. Root Cause Investigation
- Analyze stack traces to pinpoint exact code locations
- Identify potential causes (null pointers, timeouts, concurrency issues, etc.)
- Look for patterns in error conditions and triggering factors

## 5. Fix Recommendations
- Provide specific, actionable fix suggestions for each major error
- Include code examples or approaches where applicable
- Suggest monitoring improvements to catch similar issues early

## 6. Action Plan
- Create prioritized action items for error resolution
- Suggest which errors to fix immediately vs. monitor vs. investigate further
- Recommend testing strategies to prevent regression

## Parameters
Time period and severity filter: $ARGUMENTS (e.g., "7d --severity=high")

## Output Format
Provide a comprehensive error analysis report with:
- Executive summary of error landscape
- Top priority issues with specific fix recommendations
- Trend analysis and patterns identified
- Suggested monitoring and prevention strategies
- Clear next steps prioritized by impact

Focus on actionable insights rather than just data presentation.