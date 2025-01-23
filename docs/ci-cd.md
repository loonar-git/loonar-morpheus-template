# CI/CD Workflows Documentation

This document describes the GitHub Actions workflows configured in this repository.

## Source Code Validation (`code-validation.yml`)
Validates source code changes by running various linters and tests.

- **Triggers**: On push and pull requests that modify files in `src/` directory
- **Key Features**:
  - Waits for CI image workflow completion
  - Validates Python files using flake8 and pytest
  - Checks shell scripts with shellcheck
  - Validates Terraform files with `terraform fmt` and `terraform validate`
  - Runs security checks on Terraform code with tfsec

## Manual Dependabot (`manual-dependabot.yml`)
Allows manual triggering of Dependabot checks for different package ecosystems.

- **Triggers**: Manual workflow dispatch
- **Supported Ecosystems**: 
  - devcontainers
  - terraform
  - pip
  - docker
  - github-actions
- **Note**: Limited to DevOps team members

## Validation Image Publishing (`publish-validation-image.yml`)
Builds and publishes the Docker image used for code validation.

- **Triggers**: 
  - Push to main branch modifying Dockerfile or workflow
  - Manual workflow dispatch
- **Actions**: Builds and pushes image to GitHub Container Registry

## Release Process (`release.yml`)
Handles the release process and repository mirroring.

- **Triggers**: When a new release is created
- **Key Steps**:
  - Verifies CI status
  - Creates/updates repository in destination organization
  - Mirrors repository content

## Branch Protection Setup (`setup-protection.yml`)
Configures branch protection rules.

- **Triggers**: 
  - Manual workflow dispatch
  - Changes to validation directories workflow
- **Note**: Limited to DevOps team members

## Secret Scanning (`secret-scan.yml`)
Scans repository for exposed secrets and credentials.

- **Triggers**: 
  - Push events
  - Pull requests
  - Daily scheduled scan
- **Tool**: Uses Trufflehog for secret detection
- **Actions**: Fails if secrets are detected

## Directory Structure Validation (`validate-directories.yml`)
Enforces directory structure rules.

- **Triggers**: 
  - Pull requests
  - Push to main/master branches
- **Actions**: Prevents creation of new directories

## Third-Party Tools and Technologies

| Tool | Description | Website | License |
|------|-------------|----------|---------|
| GitHub Actions | CI/CD platform | [github.com/features/actions](https://github.com/features/actions) | [Terms of Service](https://docs.github.com/en/github/site-policy/github-terms-of-service) |
| Docker | Container platform | [docker.com](https://www.docker.com/) | [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) |
| Terraform | Infrastructure as Code | [terraform.io](https://www.terraform.io/) | [Mozilla Public License 2.0](https://github.com/hashicorp/terraform/blob/main/LICENSE) |
| Flake8 | Python linter | [flake8.pycqa.org](https://flake8.pycqa.org/) | [MIT](https://github.com/PyCQA/flake8/blob/main/LICENSE) |
| Pytest | Python testing framework | [pytest.org](https://pytest.org/) | [MIT](https://github.com/pytest-dev/pytest/blob/main/LICENSE) |
| ShellCheck | Shell script analysis tool | [shellcheck.net](https://www.shellcheck.net/) | [GPL v3](https://github.com/koalaman/shellcheck/blob/master/LICENSE) |
| TFSec | Terraform security scanner | [tfsec.dev](https://tfsec.dev/) | [MIT](https://github.com/aquasecurity/tfsec/blob/master/LICENSE) |
| Trufflehog | Secret scanner | [trufflesecurity.com](https://trufflesecurity.com/) | [AGPL v3](https://github.com/trufflesecurity/trufflehog/blob/main/LICENSE) |
| Dependabot | Dependency update tool | [github.com/features/security](https://github.com/features/security) | [GitHub Terms](https://docs.github.com/en/github/site-policy/github-terms-of-service) |
