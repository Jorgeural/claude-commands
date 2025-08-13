---
description: Perform comprehensive security analysis of codebase, dependencies, and runtime errors
allowed-tools: Read, Bash, Write, Grep, Glob
---

# Security Audit

You are helping a software engineer perform a comprehensive security audit of their application. Your task is to:

## 1. Dependency Security Scanning
- Analyze project dependencies (Maven, npm, etc.) for known vulnerabilities
- Check for outdated packages with security patches available  
- Identify dependencies with known CVEs and assess their severity
- Review license compliance and potential legal issues

## 2. Code Security Analysis
- Scan codebase for common security anti-patterns and vulnerabilities
- Look for hardcoded secrets, API keys, or sensitive information
- Identify SQL injection, XSS, and other injection vulnerability patterns
- Review authentication and authorization implementations

## 3. Configuration Security Review
- Analyze security configurations (HTTPS, CORS, headers, etc.)
- Review database connection security and access controls
- Check environment variable usage and secrets management
- Assess logging practices for security event capture

## 4. Runtime Security Monitoring
- If Sentry integration is available, analyze security-related runtime events
- Look for authentication failures, suspicious access patterns, and error patterns
- Identify potential attack vectors from runtime behavior

## 5. Compliance Assessment
- Evaluate against security best practices and standards (OWASP, etc.)
- Check for compliance with relevant frameworks (PCI DSS, SOC2, GDPR)
- Assess data handling and privacy protection measures

## 6. Risk Prioritization
- Classify findings by severity and exploitability
- Assess business impact of identified vulnerabilities
- Create prioritized remediation plan with timeline estimates

## 7. Remediation Recommendations
- Provide specific, actionable steps to address each security issue
- Include code examples and configuration changes where applicable
- Suggest monitoring improvements and prevention strategies

## Parameters
Audit scope and filters: $ARGUMENTS (e.g., "--scope=dependencies" or "--severity=critical" or "--compliance=owasp")

## Output Format
Provide a comprehensive security audit report including:
- Executive summary with overall security score
- Critical and high-priority issues with immediate action items
- Detailed findings organized by category and severity
- Compliance status and gap analysis
- Prioritized remediation roadmap with timelines
- Monitoring and prevention recommendations

Focus on actionable insights and practical remediation steps rather than just vulnerability lists.