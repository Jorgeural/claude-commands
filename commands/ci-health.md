---
description: Monitor and optimize CI/CD pipeline health, identifying failures and performance issues
allowed-tools: Bash, Read, Write, Grep, Glob
---

# CI Health

You are helping a software engineer monitor and optimize their CI/CD pipeline health. Your task is to:

## 1. Pipeline Performance Analysis
- Analyze build times, success rates, and performance trends over time
- Review build logs to identify common failure patterns and bottlenecks
- Assess queue times and resource utilization during builds
- Calculate key metrics like mean time to failure and recovery

## 2. Failure Pattern Investigation
- Identify the root causes of build failures and categorize them
- Analyze flaky tests and unstable pipeline components
- Review error logs and failure frequency patterns
- Distinguish between infrastructure issues and code-related failures

## 3. Build Configuration Assessment
- Review CI/CD configuration files for optimization opportunities
- Analyze job parallelization and resource allocation settings
- Check dependency caching effectiveness and strategies
- Assess build artifact management and storage optimization

## 4. Performance Optimization
- Identify slow build steps and suggest optimization strategies
- Recommend caching improvements for dependencies and build artifacts
- Analyze test execution times and suggest parallelization approaches
- Review container and environment setup efficiency

## 5. Reliability Improvement
- Suggest strategies to reduce build failures and improve stability
- Recommend retry mechanisms and failure handling improvements
- Identify opportunities for better error detection and reporting
- Propose monitoring and alerting improvements

## 6. Resource Management
- Analyze build resource consumption and cost optimization opportunities
- Review scaling strategies for peak usage periods
- Assess infrastructure efficiency and right-sizing recommendations
- Suggest improvements for build environment management

## 7. Monitoring and Alerting Setup
- Recommend comprehensive monitoring dashboards for pipeline health
- Set up alerts for build failures, performance degradation, and resource issues
- Establish key performance indicators and success metrics
- Create automated reporting for stakeholder visibility

## Parameters
Analysis timeframe and pipeline scope: $ARGUMENTS (e.g., "--timeframe=30d" or "--pipeline=main" or "--fix-issues")

## Output Format
Provide a comprehensive CI/CD health report including:
- Overall pipeline health score and key metrics summary
- Critical issues requiring immediate attention
- Performance bottleneck analysis with optimization recommendations  
- Failure pattern analysis and root cause identification
- Resource utilization assessment and cost optimization suggestions
- Monitoring setup recommendations and alerting strategies
- Prioritized action plan for pipeline improvements

Focus on practical improvements that enhance both reliability and developer productivity.