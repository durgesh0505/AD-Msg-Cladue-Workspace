Deploy web application to Azure Static Web Apps with GitHub Actions CI/CD.

## Usage

```bash
/webapp-deploy "[project description or specific deployment requirements]"
```

## Behavior

Automates Azure Static Web App deployment:

1. **Fetch Latest Docs**: Use Context7 for Azure Static Web Apps CLI and features
2. **Analyze Project**: Detect framework (React, Vue, Angular, vanilla HTML)
3. **Configure Azure**: Create or use existing Static Web App resource
4. **Setup GitHub Actions**: Generate workflow for automated deployment
5. **Deploy**: Push to GitHub and trigger build/deployment
6. **Configure**: Custom domain, environment variables, authentication if needed

## Supported Frameworks

- **React** (Create React App, Next.js, Vite)
- **Vue** (Vue CLI, Nuxt.js, Vite)
- **Angular** (Angular CLI)
- **Svelte** (SvelteKit)
- **Static HTML/CSS/JS**
- **Hugo, Jekyll** (static site generators)

## Examples

### Example 1: Deploy React App

**Command**:
```bash
/webapp-deploy "Deploy current React app to Azure Static Web App with production configuration"
```

**Process**:
1. Detect Create React App or Vite project
2. Create Azure Static Web App (or use existing)
3. Generate GitHub Actions workflow (`.github/workflows/azure-static-web-apps.yml`)
4. Configure build settings (npm install, npm run build)
5. Deploy to Azure
6. Output deployed URL

**Generated Workflow**:
```yaml
name: Azure Static Web Apps CI/CD

on:
  push:
    branches:
      - main
  pull_request:
    types: [opened, synchronize, reopened, closed]
    branches:
      - main

jobs:
  build_and_deploy_job:
    runs-on: ubuntu-latest
    name: Build and Deploy Job
    steps:
      - uses: actions/checkout@v3
        with:
          submodules: true

      - name: Build And Deploy
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          repo_token: ${{ secrets.GITHUB_TOKEN }}
          action: "upload"
          app_location: "/" # App source code path
          api_location: "" # API source code path - optional
          output_location: "build" # Built app content directory

  close_pull_request_job:
    if: github.event_name == 'pull_request' && github.event.action == 'closed'
    runs-on: ubuntu-latest
    name: Close Pull Request Job
    steps:
      - name: Close Pull Request
        uses: Azure/static-web-apps-deploy@v1
        with:
          azure_static_web_apps_api_token: ${{ secrets.AZURE_STATIC_WEB_APPS_API_TOKEN }}
          action: "close"
```

---

### Example 2: Deploy with API Backend

**Command**:
```bash
/webapp-deploy "Deploy React frontend with Azure Functions API backend. Frontend in /client, API in /api"
```

**Configuration**:
- Frontend location: `/client`
- API location: `/api`
- Output location: `build`
- Auto-configure CORS
- Environment variables for API connection

---

### Example 3: Deploy with Custom Domain

**Command**:
```bash
/webapp-deploy "Deploy Vue app and configure custom domain www.mysite.com with SSL"
```

**Process**:
1. Deploy Vue app to Static Web Apps
2. Validate domain ownership (DNS TXT record)
3. Add custom domain mapping
4. Configure managed SSL certificate
5. Update DNS (CNAME to Azure)

---

### Example 4: Deploy Multiple Environments

**Command**:
```bash
/webapp-deploy "Setup separate Static Web Apps for dev, staging, and production with branch-based deployment"
```

**Configuration**:
- Dev: Deploy from `develop` branch
- Staging: Deploy from `staging` branch
- Production: Deploy from `main` branch
- Separate Azure resources for each environment
- Environment-specific variables

---

## Azure Static Web Apps Features

### Authentication
Built-in authentication providers:
- Azure Active Directory
- GitHub
- Twitter
- Google
- Facebook

Configuration via `staticwebapp.config.json`:
```json
{
  "auth": {
    "identityProviders": {
      "azureActiveDirectory": {
        "registration": {
          "openIdIssuer": "https://login.microsoftonline.com/<tenant-id>/v2.0",
          "clientIdSettingName": "AAD_CLIENT_ID",
          "clientSecretSettingName": "AAD_CLIENT_SECRET"
        }
      }
    }
  }
}
```

### Routing
Configure routes in `staticwebapp.config.json`:
```json
{
  "routes": [
    {
      "route": "/api/*",
      "allowedRoles": ["authenticated"]
    },
    {
      "route": "/admin/*",
      "allowedRoles": ["administrator"]
    },
    {
      "route": "/*",
      "rewrite": "/index.html"
    }
  ]
}
```

### Custom Headers
```json
{
  "globalHeaders": {
    "X-Frame-Options": "DENY",
    "X-Content-Type-Options": "nosniff",
    "Content-Security-Policy": "default-src 'self'"
  }
}
```

---

## GitHub Actions Configuration

### Secrets Required
1. **AZURE_STATIC_WEB_APPS_API_TOKEN**: Deployment token from Azure
   - Get from Azure Portal: Static Web App → Manage deployment token
   - Add to GitHub: Repository Settings → Secrets → Actions

### Environment Variables
Configure in Azure Static Web App settings or GitHub Actions:
```yaml
env:
  NODE_ENV: production
  REACT_APP_API_URL: https://api.mysite.com
  VITE_API_KEY: ${{ secrets.API_KEY }}
```

### Build Configuration
Customize for different frameworks:

**React (Vite)**:
```yaml
app_location: "/"
api_location: "api"
output_location: "dist"
```

**Vue (Vue CLI)**:
```yaml
app_location: "/"
output_location: "dist"
```

**Angular**:
```yaml
app_location: "/"
output_location: "dist/my-app"
```

---

## Cost Optimization

**Free Tier Includes**:
- 100 GB bandwidth/month
- 0.5 GB storage
- Custom domains
- SSL certificates
- Authentication
- Preview environments (staging slots)

**Standard Tier** ($9/month):
- Increased bandwidth
- Custom authentication providers
- SLA guarantee

---

## Custom Domain Setup

### DNS Configuration
```
Type: CNAME
Name: www
Value: <your-static-web-app>.azurestaticapps.net

Type: ALIAS or ANAME (for apex domain)
Name: @
Value: <your-static-web-app>.azurestaticapps.net
```

### SSL Certificate
Automatic managed certificate from Azure
- Free
- Auto-renewed
- Takes 5-10 minutes to provision

---

## Troubleshooting

### Build Failures
Common issues:
- Incorrect `output_location` (check framework build output)
- Missing environment variables
- Node version mismatch (specify in workflow)

### Deployment Delays
- First deployment: 5-15 minutes
- Subsequent deployments: 2-5 minutes
- SSL provisioning: 5-10 minutes

### 404 Errors
- Check `staticwebapp.config.json` routes
- Ensure SPA rewrite rule: `"route": "/*", "rewrite": "/index.html"`

---

## Integration

- **Context7 MCP**: Latest Azure Static Web Apps features
- **Azure Deployer Agent**: Deployment specialist
- **GitHub Integration**: Automatic workflow creation

---

## Best Practices

- ✅ Use branch-based environments (dev/staging/prod)
- ✅ Configure `staticwebapp.config.json` for routing
- ✅ Enable authentication for protected routes
- ✅ Set up custom domain early (DNS propagation time)
- ✅ Use environment variables for API endpoints
- ✅ Enable Application Insights for monitoring
- ✅ Test in preview environments before production

---

## Related Commands

- `/storage-setup` - Configure Azure Storage for static assets
- `/github-workflow` - Create custom GitHub Actions workflows
- `/ps-azure` - General Azure PowerShell operations

---

## Quick Start

1. **Prepare Project**: Ensure project builds locally
2. **Run Command**: `/webapp-deploy "description"`
3. **Commit Workflow**: Push generated `.github/workflows/` file
4. **Configure Secrets**: Add Azure deployment token to GitHub
5. **Deploy**: Push to main branch triggers deployment
6. **Verify**: Check deployment URL in GitHub Actions output

---

## Documentation Generated

After deployment, the command generates:
- `DEPLOYMENT.md` - Deployment URL, configuration, custom domain steps
- `.github/workflows/azure-static-web-apps.yml` - CI/CD workflow
- `staticwebapp.config.json` - Static Web App configuration (if needed)

---

## Support

**Common Issues**:
- Build failures → Check build logs in GitHub Actions
- 404 errors → Verify routing configuration
- Authentication issues → Check `staticwebapp.config.json`

**Azure Resources**:
- [Static Web Apps Documentation](https://docs.microsoft.com/en-us/azure/static-web-apps/)
- [Configuration Reference](https://docs.microsoft.com/en-us/azure/static-web-apps/configuration)
