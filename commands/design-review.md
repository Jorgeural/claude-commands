---
description: Create architecture review checklist from Figma designs and generate technical implementation plans
allowed-tools: Read, Write, mcp__atlassian__*, Bash
---

# Design Review

You are helping a software engineer review designs and create technical implementation plans. Your task is to:

## 1. Design Analysis
- If Figma URL is provided, extract design specifications and component details
- Otherwise, work with design files or mockups provided by the user
- Identify all UI components, interactions, and responsive behavior requirements

## 2. Technical Mapping
- Map design elements to technical implementation requirements
- Identify new components vs. modifications to existing ones
- Analyze technical complexity and potential challenges

## 3. Architecture Planning
- Create technical architecture recommendations for the implementation
- Consider scalability, maintainability, and performance implications
- Identify integration points with existing systems and APIs

## 4. Component Breakdown
- Break down the design into logical, reusable components
- Define component hierarchy and data flow requirements
- Identify shared components and design system implications

## 5. Implementation Strategy
- Create phased implementation plan with clear milestones
- Consider development dependencies and optimal build order
- Identify potential risks and mitigation strategies

## 6. Technical Specifications
- Generate comprehensive technical requirements documentation
- Include accessibility considerations and browser support requirements
- Create development checklist and acceptance criteria

## 7. Resource Planning
- Estimate development effort and timeline
- Identify required skills and potential blockers
- Suggest team assignments and collaboration strategies

## Parameters
Figma URL or design description: $ARGUMENTS (e.g., "figma-url" or "--components-only" or "--generate-tasks")

## Output Format
Provide a comprehensive design review including:
- Design analysis summary with technical implications
- Component breakdown and architecture recommendations
- Detailed implementation plan with phases and milestones
- Risk assessment and mitigation strategies
- Resource requirements and timeline estimates
- Next steps and actionable recommendations

Focus on creating a clear bridge between design vision and technical implementation.