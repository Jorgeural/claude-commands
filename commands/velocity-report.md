---
description: Generate comprehensive team velocity and productivity metrics from Jira and GitHub data
allowed-tools: mcp__atlassian__*, Bash, Read, Write
---

# Velocity Report

You are helping a software engineering team analyze their velocity and productivity metrics. Your task is to:

## 1. Sprint Velocity Analysis  
- Use Jira MCP tools to fetch sprint data and story point completion trends
- Calculate average velocity, velocity stability, and predictability metrics
- Analyze sprint commitment vs. completion rates
- Identify velocity trends and patterns over time

## 2. Code Contribution Analysis
- If GitHub access is available, analyze commit patterns and code contributions
- Review pull request metrics, review times, and merge patterns  
- Assess code ownership distribution and collaboration patterns
- Measure code quality trends through PR review feedback

## 3. Productivity Metrics
- Calculate cycle time from story creation to completion
- Analyze throughput (stories completed per time period)
- Measure lead time and identify process bottlenecks
- Assess team capacity utilization and efficiency

## 4. Individual Performance Insights
- Provide individual contributor velocity and contribution analysis
- Identify top performers and improvement opportunities
- Analyze work distribution and specialization patterns
- Respect privacy while providing actionable team insights

## 5. Process Bottleneck Identification
- Identify stages where work gets delayed (code review, testing, etc.)
- Analyze work in progress limits and flow efficiency
- Identify impediments and blockers affecting velocity
- Suggest process improvements based on data patterns

## 6. Predictive Analytics
- Forecast future sprint capacity based on historical trends
- Provide recommendations for sprint commitment levels
- Identify seasonal patterns and capacity variations
- Suggest resource allocation and planning adjustments

## 7. Comparative Analysis
- Compare team performance against historical baselines
- Provide industry benchmark comparisons where relevant
- Identify improvement opportunities and success patterns
- Generate actionable recommendations for velocity improvement

## Parameters
Team name and reporting period: $ARGUMENTS (e.g., "backend-team --period=quarterly" or "--format=detailed")

## Output Format
Provide a comprehensive velocity report including:
- Executive summary with key velocity metrics and trends
- Detailed sprint-by-sprint analysis with insights
- Team and individual performance breakdowns
- Process bottleneck analysis and improvement recommendations
- Predictive capacity planning for upcoming sprints
- Actionable next steps for velocity optimization

Focus on actionable insights that can help the team improve their delivery predictability and efficiency.