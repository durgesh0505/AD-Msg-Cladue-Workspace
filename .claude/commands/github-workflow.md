Generate GitHub Actions workflow for CI/CD automation.

## Usage

```bash
/github-workflow "[workflow description]"
```

## Examples

**Basic CI/CD**:
```bash
/github-workflow "Create CI/CD workflow for Node.js app: build, test, deploy to Azure on main branch push"
```

**Multi-Environment**:
```bash
/github-workflow "Deploy to dev on develop branch, staging on staging branch, production on main branch with manual approval"
```

**With Testing**:
```bash
/github-workflow "Run unit tests, integration tests, generate code coverage report, deploy if tests pass"
```

## Features Generated

- Trigger configuration (push, pull_request, manual)
- Build steps (npm, dotnet, maven, etc.)
- Test execution
- Deployment to Azure (App Service, Static Web Apps, Functions)
- Environment variables and secrets management
- Multi-stage workflows (build → test → deploy)
- Manual approval gates

## Integration

Uses Context7 for latest GitHub Actions syntax and Azure deployment actions.
