# DigitalOcean App Platform Example for Shiny

https://www.digitalocean.com/products/app-platform/

https://www.digitalocean.com/docs/app-platform/languages-frameworks/docker/

https://github.com/digitalocean/sample-dockerfile

[![Deploy to DigitalOcean](https://www.deploytodo.com/do-btn-blue.svg)](https://cloud.digitalocean.com/apps/new?repo=https://github.com/analythium/app-platform-shiny/tree/main)

The deploy to DO button needs the `.do/deploy.template.yaml` file
https://www.digitalocean.com/docs/app-platform/how-to/add-deploy-do-button/

YAML spec for `.do/app.yaml`: https://www.digitalocean.com/docs/app-platform/references/app-specification-reference/

- `name`: String. The name of the app. Must be unique across __all apps in the same account__.Minimum length: 2. Maximum length: 32. Must comply with the following regular expression: `^[a-z][a-z0-9-]{0,30}[a-z0-9]$`.
- `services`: Array of Objects. Workloads which expose publicy-accessible HTTP services.
  - `name`: String. The name. Must be unique across __all components within the same app__.

git, github, gitlab, or image can be set for git/github/gitlab repo or a registry image (DOCR or Docker Hub)

```yaml
# app.yaml
name: app-platform-shiny
services:
- dockerfile_path: Dockerfile
  github:
    branch: main
    deploy_on_push: true
    repo: analythium/app-platform-shiny
  name: app-platform-shiny
```

Otherwise, the app structure follows the Heroku setup. In fact, the same Dockerfile can be deployed to both. The trick to prevent timeout is not necessary on DO (it is paid plan).
