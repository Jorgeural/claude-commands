---
description: Generate a session documentation file using the session template with TL;DR summary
allowed-tools: Write, Read, Bash
---

# Document Session

You are helping a software engineer document their Claude session. Your task is to:

## 1. Parse Arguments and Setup
- Parse the session title from $ARGUMENTS (format: "title [--path=/custom/path]")
- Generate filename as `{YYYYMMDD}-{title}-session.md` 
- Use current working directory unless --path is specified
- Get current date for the filename and document content

## 2. Create Comprehensive Session Documentation
Create a session documentation file using this enhanced template structure:

### File Header (Always Include)
```markdown
# Claude Session Brief: [Title]

## 📄 TL;DR
**What was accomplished**: [1-2 sentence summary]
**Key deliverables**: [List 2-3 main outputs]
**Status**: [Complete/Ongoing/Blocked] 
**Next actions**: [1-2 immediate next steps]

---

## 📋 Session Overview
**Project/Objective**: [Brief description]
**Date**: [Current date]
**Duration**: [User to fill]
**Claude Model**: Claude Sonnet 4
**Session Type**: [Development/Research/Analysis/Debugging/Planning]
```

### Core Sections (Include as relevant)
- **🎯 Goals**: Primary and secondary objectives, success criteria
- **🔄 Session Flow**: Major phases with user prompts, Claude actions, outcomes
- **🛠️ Technical Details**: Tools used, key decisions, challenges
- **📊 Deliverables**: Files created/modified, features implemented
- **🧠 Problem-Solving**: Claude's approach, strengths, collaboration style
- **🎓 Key Learnings**: Insights for future sessions, improvement areas
- **🚀 Next Steps**: Immediate actions, future iterations
- **📈 Success Metrics**: Objectives achieved, quality ratings
- **💡 Notable Insights**: Key quotes or breakthroughs
- **🔗 Resources**: Documentation, references used

## 3. Smart Content Generation
- Focus on **precision over completion** - only include sections with meaningful content
- **Prioritize TL;DR**: Make it immediately valuable for quick reference
- **Be adaptive**: If a session was primarily research, emphasize learnings; if development, emphasize deliverables
- **Keep it scannable**: Use bullet points, clear headers, concise language
- **Add placeholders** where user input is needed: [User to fill: specific context]

## 4. File Creation
- Write the file to the specified or default path
- Confirm successful creation with full file path
- Provide usage guidance for filling in user-specific details

## Parameters
Session documentation request: $ARGUMENTS
Expected format: "session-title [--path=/custom/path]"
Generated filename: `{YYYYMMDD}-{title}-session.md`

## Output Format
1. **Confirmation**: "Created session documentation: [full-file-path]"
2. **Template guidance**: Brief note on which sections are most relevant for this type of session
3. **Next steps**: Remind user to fill in placeholders and customize as needed

## Usage Examples
```bash
# Creates: 20250814-project-setup-session.md
/document-session project-setup

# Creates: 20250814-debugging-auth-session.md in custom path
/document-session debugging-auth --path=/docs/sessions
```

## Key Principles
- **Template as guide**: Sections should be included based on relevance, not completionism
- **Concise but complete**: Capture essence without overwhelming detail
- **User-friendly**: Make it easy for the user to fill in their specific details
- **TL;DR first**: Most important summary at the top for quick reference