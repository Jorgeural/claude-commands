---
description: Analyze and optimize build process performance, identifying bottlenecks and implementing improvements
allowed-tools: Bash, Read, Write, Edit, Grep
---

# Build Optimize

You are helping a software engineer optimize their build process for better performance and reliability. Your task is to:

## 1. Build Performance Analysis
- Analyze current build times and identify performance bottlenecks
- Examine build logs to understand where time is being spent
- Review build configuration files (Maven pom.xml, Gradle, package.json, etc.)
- Assess resource utilization during builds

## 2. Dependency Optimization
- Review project dependencies for unused or redundant packages
- Identify opportunities for dependency updates and consolidation
- Analyze dependency download times and caching effectiveness
- Check for dependency conflicts that might slow builds

## 3. Cache Strategy Evaluation
- Assess current caching mechanisms and their effectiveness
- Identify opportunities for better build artifact caching
- Review CI/CD cache configurations and hit rates
- Recommend optimal caching strategies for different build stages

## 4. Build Configuration Optimization
- Review and optimize build tool configurations (Maven, Gradle, webpack, etc.)
- Analyze parallelization settings and thread utilization
- Optimize memory allocation and JVM settings where applicable
- Review and streamline build phases and tasks

## 5. CI/CD Pipeline Enhancement
- If CircleCI or other CI tools are available, analyze pipeline performance
- Identify opportunities for parallel job execution
- Review pipeline resource allocation and scaling strategies
- Assess build failure patterns and suggest reliability improvements

## 6. Testing Strategy Optimization
- Analyze test execution times and identify slow test categories
- Recommend test parallelization and categorization strategies
- Suggest approaches for smart test selection based on code changes
- Review test data management and setup/teardown optimization

## 7. Implementation Planning
- Create prioritized optimization plan with expected impact
- Provide specific configuration changes and code examples
- Estimate implementation effort and performance improvements
- Set up monitoring for build performance regression detection

## Parameters
Build target and options: $ARGUMENTS (e.g., "--target=maven" or "--analyze-only" or "--implement-fixes")

## Output Format
Provide a comprehensive build optimization report including:
- Current build performance baseline and bottleneck analysis
- Prioritized optimization recommendations with expected impact
- Specific configuration changes and implementation steps
- Performance monitoring setup and regression prevention strategies
- Timeline and resource requirements for implementing improvements

Focus on practical, high-impact optimizations that can be implemented safely without disrupting the development workflow.