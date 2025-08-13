# Custom Claude Slash Commands Ideas

This document contains ideas for custom slash commands designed specifically for software engineers. These commands leverage MCP tools including GitHub, Jira, Confluence, Slack, Google Drive, Figma, Maven, Sentry, and CircleCI.

## 🚀 Development Workflow Commands

### `/sprint-setup`
**Purpose**: Initialize a new sprint with complete setup
**MCP Tools**: Jira, GitHub, Slack
**Features**:
- Fetch assigned Jira tickets for the sprint
- Create feature branches for each ticket
- Generate sprint documentation
- Notify team in Slack
- Set up local development environment

### `/pr-ready`
**Purpose**: Comprehensive pre-PR checklist and preparation
**MCP Tools**: GitHub, CircleCI, Sentry
**Features**:
- Run code quality checks
- Execute test suite
- Check CI/CD pipeline status
- Generate PR description from commits
- Validate no breaking changes

### `/deploy-check`
**Purpose**: Validate deployment readiness
**MCP Tools**: CircleCI, Sentry, GitHub
**Features**:
- Check CI/CD pipeline status
- Verify all tests pass
- Check for recent Sentry errors
- Validate environment configurations
- Generate deployment checklist

### `/hotfix-flow`
**Purpose**: Emergency hotfix workflow automation
**MCP Tools**: GitHub, Jira, Slack, Sentry
**Features**:
- Create hotfix branch from main
- Link to critical Jira ticket
- Notify stakeholders in Slack
- Fast-track CI/CD pipeline
- Generate incident report

### `/release-notes`
**Purpose**: Generate comprehensive release notes
**MCP Tools**: Jira, GitHub, Confluence
**Features**:
- Aggregate Jira tickets since last release
- Parse commit messages for changes
- Generate user-facing changelog
- Create technical release notes for Confluence
- Tag contributors

## 🐛 Debugging & Monitoring Commands

### `/debug-session`
**Purpose**: Set up debugging environment with context
**MCP Tools**: Sentry, GitHub, Jira
**Features**:
- Pull recent error logs from Sentry
- Find related GitHub issues
- Set up debugging environment
- Generate debugging checklist
- Link to relevant Jira tickets

### `/error-analysis`
**Purpose**: Analyze error patterns and suggest fixes
**MCP Tools**: Sentry, GitHub
**Features**:
- Analyze error frequency and trends
- Identify common error patterns
- Suggest code fixes based on stack traces
- Generate error monitoring dashboard
- Create follow-up tasks

### `/performance-audit`
**Purpose**: Comprehensive performance analysis
**MCP Tools**: Sentry, CircleCI, GitHub
**Features**:
- Analyze performance metrics from Sentry
- Check build times in CircleCI
- Identify performance bottlenecks in code
- Suggest optimization strategies
- Generate performance report

### `/incident-report`
**Purpose**: Generate incident post-mortem documentation
**MCP Tools**: Sentry, Jira, Confluence, Slack
**Features**:
- Compile timeline from multiple sources
- Document root cause analysis
- Create action items in Jira
- Generate Confluence post-mortem
- Notify stakeholders in Slack

## 📋 Project Management Commands

### `/epic-breakdown`
**Purpose**: Break down large epics into manageable tasks
**MCP Tools**: Jira, Figma, Confluence
**Features**:
- Analyze epic requirements from Jira
- Reference design mockups from Figma
- Generate subtasks and stories
- Estimate effort and timeline
- Create technical specification in Confluence

### `/ticket-estimate`
**Purpose**: AI-powered story point estimation
**MCP Tools**: Jira, GitHub
**Features**:
- Analyze similar completed tickets
- Review code complexity patterns
- Factor in historical velocity
- Provide estimation reasoning
- Update Jira with estimates

### `/dependency-map`
**Purpose**: Visualize and manage project dependencies
**MCP Tools**: Maven, GitHub, Jira
**Features**:
- Scan Maven dependencies for conflicts
- Map feature dependencies in GitHub
- Identify blocking tickets in Jira
- Generate dependency diagram
- Suggest resolution strategies

### `/tech-debt-audit`
**Purpose**: Identify and prioritize technical debt
**MCP Tools**: GitHub, Sentry, Jira
**Features**:
- Scan codebase for code smells
- Analyze error patterns from Sentry
- Calculate technical debt score
- Create prioritized backlog items in Jira
- Generate refactoring roadmap

## 🤝 Team Collaboration Commands

### `/code-handoff`
**Purpose**: Create comprehensive knowledge transfer documentation
**MCP Tools**: GitHub, Confluence, Slack
**Features**:
- Document recent code changes from GitHub
- Create handoff guide in Confluence
- Schedule knowledge transfer session
- Notify relevant team members in Slack
- Generate Q&A checklist

### `/knowledge-share`
**Purpose**: Extract and share technical knowledge
**MCP Tools**: Confluence, Slack, GitHub
**Features**:
- Generate technical documentation from code
- Create how-to guides in Confluence
- Share learnings with team in Slack
- Link related GitHub repositories
- Schedule knowledge sharing sessions

### `/standup-prep`
**Purpose**: Prepare daily standup updates
**MCP Tools**: Jira, GitHub, Slack
**Features**:
- Summarize yesterday's commits from GitHub
- Check Jira ticket progress
- Identify blockers and impediments
- Generate standup talking points
- Optional: Post to Slack standup channel

### `/team-sync`
**Purpose**: Synchronize updates across team channels
**MCP Tools**: Slack, Jira, Confluence, GitHub
**Features**:
- Aggregate team updates from multiple sources
- Generate weekly team report
- Update project status in Confluence
- Share highlights in Slack
- Track team velocity and health

## 🏗️ Architecture & Design Commands

### `/design-review`
**Purpose**: Create architecture review checklist from designs
**MCP Tools**: Figma, Confluence, GitHub
**Features**:
- Extract design specifications from Figma
- Generate technical implementation plan
- Create architecture review checklist
- Document decisions in Confluence
- Link to related GitHub repositories

### `/api-design`
**Purpose**: Design and document APIs comprehensively
**MCP Tools**: GitHub, Confluence, Maven
**Features**:
- Generate OpenAPI specifications
- Create API documentation in Confluence
- Set up contract testing framework
- Update Maven dependencies
- Generate client SDKs

### `/schema-migrate`
**Purpose**: Plan and validate database schema changes
**MCP Tools**: GitHub, Jira
**Features**:
- Analyze proposed schema changes
- Generate migration scripts
- Validate backward compatibility
- Create rollback procedures
- Document changes in GitHub

### `/service-health`
**Purpose**: Check microservice ecosystem health
**MCP Tools**: Sentry, CircleCI, GitHub
**Features**:
- Monitor service dependencies
- Check deployment status across environments
- Analyze error rates from Sentry
- Validate service contracts
- Generate health dashboard

## 🔍 Code Quality Commands

### `/refactor-plan`
**Purpose**: Analyze code and create refactoring roadmap
**MCP Tools**: GitHub, Jira, Confluence
**Features**:
- Identify refactoring opportunities
- Analyze code complexity metrics
- Generate refactoring tasks in Jira
- Create implementation plan in Confluence
- Estimate effort and timeline

### `/security-audit`
**Purpose**: Comprehensive security analysis
**MCP Tools**: GitHub, Maven, Sentry
**Features**:
- Scan for security vulnerabilities
- Check Maven dependencies for known issues
- Analyze Sentry logs for security events
- Generate security report
- Create remediation action items

### `/test-coverage`
**Purpose**: Analyze and improve test coverage
**MCP Tools**: GitHub, CircleCI
**Features**:
- Analyze current test coverage metrics
- Identify untested code areas
- Generate test improvement suggestions
- Create testing tasks
- Monitor coverage trends

### `/code-style`
**Purpose**: Enforce consistent coding standards
**MCP Tools**: GitHub
**Features**:
- Analyze code style violations
- Apply consistent formatting
- Generate style guide documentation
- Set up automated style checking
- Create PR templates with style checklist

## 📦 Build & Deployment Commands

### `/build-optimize`
**Purpose**: Optimize build process and performance
**MCP Tools**: CircleCI, Maven, GitHub
**Features**:
- Analyze build times and bottlenecks
- Optimize Maven configuration
- Improve CircleCI pipeline efficiency
- Generate build optimization report
- Implement caching strategies

### `/env-sync`
**Purpose**: Synchronize environment configurations
**MCP Tools**: GitHub, CircleCI
**Features**:
- Compare environment configurations
- Identify configuration drift
- Generate synchronization tasks
- Update environment variables
- Validate configuration consistency

### `/docker-health`
**Purpose**: Optimize Docker containers and deployments
**MCP Tools**: GitHub, CircleCI
**Features**:
- Analyze Docker image sizes
- Optimize Dockerfile configurations
- Check container security
- Improve build caching
- Generate optimization recommendations

### `/maven-audit`
**Purpose**: Comprehensive Maven project analysis
**MCP Tools**: Maven, GitHub
**Features**:
- Analyze dependency versions and conflicts
- Check for security vulnerabilities
- Suggest dependency updates
- Optimize Maven configuration
- Generate dependency report

## 📊 Analytics & Reporting Commands

### `/velocity-report`
**Purpose**: Generate team velocity and productivity metrics
**MCP Tools**: Jira, GitHub
**Features**:
- Calculate sprint velocity from Jira
- Analyze commit patterns from GitHub
- Generate productivity insights
- Create velocity trend charts
- Identify improvement opportunities

### `/commit-analysis`
**Purpose**: Analyze commit patterns and code ownership
**MCP Tools**: GitHub
**Features**:
- Analyze commit frequency and patterns
- Map code ownership across repositories
- Identify collaboration patterns
- Generate contribution reports
- Track code quality trends

### `/bug-trends`
**Purpose**: Analyze bug patterns and hotspots
**MCP Tools**: Sentry, Jira, GitHub
**Features**:
- Identify bug frequency patterns
- Map bugs to code areas
- Analyze resolution times
- Predict potential bug hotspots
- Generate quality improvement recommendations

### `/feature-impact`
**Purpose**: Measure feature adoption and impact
**MCP Tools**: Sentry, GitHub, Jira
**Features**:
- Track feature usage metrics
- Analyze user engagement
- Measure feature success metrics
- Generate impact reports
- Identify optimization opportunities

## 🔄 Integration & Automation Commands

### `/workspace-setup`
**Purpose**: Set up complete development workspace
**MCP Tools**: GitHub, Maven, Slack
**Features**:
- Clone required repositories
- Set up Maven projects
- Configure IDE settings
- Join relevant Slack channels
- Generate workspace documentation

### `/ci-health`
**Purpose**: Monitor and optimize CI/CD pipelines
**MCP Tools**: CircleCI, GitHub
**Features**:
- Analyze pipeline success rates
- Identify slow or failing builds
- Optimize pipeline configurations
- Generate CI/CD health report
- Create improvement recommendations

### `/docs-sync`
**Purpose**: Synchronize documentation across platforms
**MCP Tools**: Confluence, GitHub, Slack
**Features**:
- Sync README files with Confluence
- Update API documentation
- Notify team of documentation changes
- Validate documentation completeness
- Generate documentation metrics

---

*Total Commands: 34*

Each command is designed to enhance developer productivity by leveraging the available MCP tools and automating common software engineering tasks.