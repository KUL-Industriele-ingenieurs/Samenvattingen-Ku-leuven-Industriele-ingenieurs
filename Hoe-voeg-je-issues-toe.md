# GitHub Issues Integration in VS Code - Implementation Guide

Based on the official VS Code GitHub Issues integration, here's what you need to set up:

## What You Get

### 1. **Issue Hovers** - See issue details on hover
- Hover over `#1234` to see issue title, status, assignee
- Works with full URLs, issue numbers, and `owner/repo#1234` format
- Also shows user info when hovering over `@username`

### 2. **Issue Completions** - Auto-complete issues
- Type `#` and get suggestions for issues
- Works in:
  - Commit messages (configurable format)
  - Markdown files (as links)
  - Source code (as `#1234`)

### 3. **Create Issues from Code**
- **From TODO comments**: Create issue directly from `// @issue:` comments
- **From selection**: Select code → Create issue with permalink back to code
- **From clipboard**: Copy terminal error → Create issue

### 4. **Work on Issues** - Complete workflow
- View issues in sidebar
- Start work on issue (creates branch automatically)
- Make commits
- Create PR

## Setup Steps

### 1. Install Extension
```
Extension ID: GitHub.vscode-pull-request-github
Name: GitHub Pull Requests and Issues
```

### 2. Configure Settings

Add to `.vscode/settings.json`:

```json
{
  // Define which issues to show/complete
  "githubIssues.queries": [
    {
      "label": "My Issues",
      "query": "is:open is:issue assignee:@me repo:${owner}/${repository}"
    },
    {
      "label": "Created Issues",
      "query": "is:open is:issue author:@me repo:${owner}/${repository}"
    },
    {
      "label": "All Open Issues",
      "query": "is:open is:issue repo:${owner}/${repository}"
    },
    {
      "label": "@issue markers",
      "query": "is:open is:issue label:from-code repo:${owner}/${repository}"
    }
  ],

  // Trigger for creating issues from comments
  "githubIssues.createIssueTriggers": [
    "@issue",
    "TODO",
    "FIXME"
  ],

  // Branch settings when working on issues
  "githubIssues.useBranchForIssues": true,
  "githubIssues.issueBranchTitle": "issue${issueNumber}",
  
  // How to format issue completions in SCM commit box
  "githubIssues.issueCompletionFormatScm": "#${issueNumber}",
  
  // Working issue format
  "githubIssues.workingIssueFormatScm": "#${issueNumber}"
}
```

### 3. Authenticate
1. Open Command Palette (`Ctrl+Shift+P`)
2. Type "GitHub: Sign in"
3. Authenticate with GitHub

## How to Use

### Create Issue from `@issue` Comment

1. In your .tex file, write:
```latex
% @issue: Need to add more examples for thermodynamics
% This section needs practical examples with calculations
```

2. Click the lightbulb 💡 that appears, or press `Ctrl+.`
3. Select "Create issue from comment"
4. VS Code creates the GitHub issue with the description

**Automatic permalinks and labels**

We have a GitHub Actions workflow that will automatically add a clickable GitHub code permalink and the `from-code` label to issues that originate from `@issue`/`@todo` markers.

- The workflow runs when an issue is **opened**, **edited**, or **reopened**.
- It parses the issue body for the marker and the `In file <path>` line (or searches `.tex` files in the repo) to determine the file and line number.
- If it finds a match, it will post a comment like:

  `🔗 Code permalink: https://github.com/<owner>/<repo>/blob/<branch>/path/to/file.tex#L42`

- If it cannot locate the file or marker, the workflow will leave an explanatory comment reminding you to commit the file and ensure the marker exists.

**Tip:** If the initial issue body does not include a file path or the permalink is missing, edit the issue (for example paste the `% @issue:` line or the file path), and the workflow will update the issue with the permalink automatically.

### View and Work on Issues

1. Open **Source Control** view (`Ctrl+Shift+G`)
2. Look for **GITHUB** section at the bottom
3. See your configured issue queries
4. Right-click an issue → "Start Working on Issue"
   - Creates a branch automatically
   - You can commit and create PR later

### Use Issue Completions

- In commit message: Type `#` → select issue
- In Markdown: Type `#` → creates link `[#123](url)`
- In code: Type `#123` or `Microsoft/vscode#123`

### Create Issue from Selection

1. Select code in editor
2. Command Palette: "GitHub Issues: Create Issue from Selection"
3. Issue is created with permalink back to that code

### Copy GitHub Permalink

1. Select code
2. Command Palette: "GitHub Issues: Copy GitHub Permalink"
3. Paste in issue/PR/chat

## Your Current Workflow

With this setup, your workflow becomes:

1. **While coding**, add `% @issue:` comments for TODOs
2. **Later**, use lightbulb to create GitHub issues
3. **View issues** in Source Control → GitHub section
4. **Pick an issue** to work on → auto-creates branch
5. **Reference issues** in commits using `#` completions
6. **Hover over** issue numbers to see details without leaving editor

## When You Complete an Issue

When you finish working on an issue, you have two options:

### Option 1: Remove the @issue comment (Recommended)
```latex
% @issue: Add more examples for thermodynamics  ← DELETE THIS LINE
% This section needs practical examples

\section{Thermodynamics}
% Your completed work here
```

### Option 2: Mark as done
```latex
% Done: Added examples for thermodynamics (see issue #123)
```

### Close the GitHub Issue
In your commit message, reference the issue to auto-close it:
```
git commit -m "Add thermodynamics examples

Fixes #123"
```

Or use these keywords in your commit:
- `Fixes #123` or `Closes #123` - Auto-closes the issue
- `Refs #123` - Just references, doesn't close

## What About the Scripts?

Keep the Python scripts for:
- **Batch operations**: Create many issues at once
- **Custom workflows**: If you need something the extension doesn't do
- **Automation**: CI/CD or automated issue creation

But for daily work, use the native VS Code integration - it's much better!
