# CI/CD Configuration Documentation

This document describes the CI/CD configurations present in the `.github` directory.

## GitHub Actions Workflows

### 1. CI Workflow (`CI.yml`)

The main continuous integration pipeline that runs on all branch pushes and pull requests, except version tags.

Key features:
- Checks for dependency on CI image build workflow
- Runs in a custom Docker container (`loonar-morpheus-template`)
- Performs the following validations on changed files:
  - Shell script linting using ShellCheck
  - Terraform formatting and validation
  - Security scanning with tfsec
  - Secret detection using trufflehog
  - Python code style checking with flake8
  - Python tests execution with pytest

### 2. CI Image Publisher (`publish-ci-image.yml`)

Handles the building and publishing of the CI Docker image used by the main pipeline.

- Triggers:
  - Push to main branch (when Dockerfile or workflow changes)
  - Manual workflow dispatch
- Builds and pushes the image to GitHub Container Registry (ghcr.io)
- Uses Docker Buildx for image building
- Requires specific permissions for packages and ID token

### 3. Release Workflow (`release.yml`)

Manages the release process and repository mirroring.

Features:
- Triggers on release creation
- Installs GitHub CLI
- Verifies CI workflow status
- Copies repository to loonar-morpheus organization
- Creates destination repository if it doesn't exist
- Performs a mirror push of the entire repository

### 4. Branch Protection Setup (`setup-protection.yml`)

Manages the configuration of branch protection rules.

Features:
- Triggers:
  - Manual workflow dispatch
  - Push events to validation directories workflow
- Access Control:
  - Restricted to DevOps team members only
  - Validates team membership before execution
  - Denies access with error message for non-DevOps members
- Execution:
  - Runs branch protection setup script
  - Uses custom PAT (Personal Access Token) for authentication
  - Executes on Ubuntu latest

### 5. Directory Structure Validation (`validate-directories.yml`)

Enforces directory structure rules in the repository.

Features:
- Triggers:
  - Pull requests with path changes
  - Push events to main/master branches
- Validation:
  - Prevents creation of new directories in root
  - Prevents creation of new subdirectories at any level
  - Uses git diff to detect directory changes
- Error Handling:
  - Provides clear error messages for violations
  - Lists detected new directories (both root and subdirectories)
  - Fails the workflow if new directories are detected

### 6. Dependabot Configuration (`dependabot.yml`)

Automated dependency updates for multiple ecosystems:

- DevContainers: Weekly updates for development container
- Terraform: Weekly updates for infrastructure code
- Python (pip): Weekly updates for Python dependencies
- Docker: Weekly updates for Docker configurations
- GitHub Actions: Weekly updates for workflow dependencies

### 7. CI Docker Image (`Dockerfile`)

Custom Ubuntu-based Docker image used for CI/CD pipelines with pre-installed tools:

- Base: Ubuntu 22.04
- Installed tools:
  - Go 1.21.1
  - Terraform
  - ShellCheck
  - tfsec
  - truffleHog
  - flake8
  - pytest
  - Python pip
  - Various system utilities

### 8. Manual Dependabot Check (`manual-dependabot.yml`)

Manually triggers Dependabot checks for specific package ecosystems.

- Triggers:
  - Manual workflow dispatch
- Input:
  - Select package ecosystem to check
- Execution:
  - Runs Dependabot checks for selected ecosystem

## Security and Best Practices

- All workflows use specific Ubuntu versions (22.04 or 24.04)
- Secure handling of GitHub tokens and permissions
- Comprehensive security scanning:
  - Infrastructure security with tfsec
  - Secret detection with trufflehog
  - Dependency vulnerability scanning with Dependabot
- Automated code quality checks
- Isolated CI environment using custom Docker container

## Workflow Sequence

1. **Initial Setup**:
   - Branch protection rules are configured via `setup-protection.yml`
   - Directory structure rules are enforced via `validate-directories.yml`
   - Only DevOps team members can modify these settings

2. **Development Process**:
   - Developers create branches/PRs
   - Directory structure is validated automatically
   - CI workflow (`CI.yml`) runs checks
   - Dependabot creates automated update PRs

3. **Continuous Integration**:
   - CI image is built and published when needed
   - All code changes are validated against:
     - Directory structure rules
     - Security standards
     - Code quality requirements

4. **Release Process**:
   - Release is created
   - CI status is verified
   - Repository is mirrored to destination organization

## Tools and Solutions Reference

This section lists all tools and solutions used in our CI/CD workflows, along with their official documentation.

### Infrastructure and Security
- **Terraform** - Infrastructure as Code
  - Official Site: https://www.terraform.io/
  - Documentation: https://developer.hashicorp.com/terraform/docs

- **tfsec** - Security Scanner for Terraform
  - Official Site: https://aquasecurity.github.io/tfsec/
  - GitHub Repository: https://github.com/aquasecurity/tfsec

- **TruffleHog** - Secret Scanner
  - Official Site: https://trufflesecurity.com/trufflehog
  - GitHub Repository: https://github.com/trufflesecurity/trufflehog

### Code Quality and Testing
- **ShellCheck** - Shell Script Analysis
  - Official Site: https://www.shellcheck.net/
  - Documentation: https://github.com/koalaman/shellcheck/wiki

- **Flake8** - Python Style Guide Enforcement
  - Documentation: https://flake8.pycqa.org/
  - GitHub Repository: https://github.com/PyCQA/flake8

- **pytest** - Python Testing Framework
  - Official Site: https://docs.pytest.org/
  - GitHub Repository: https://github.com/pytest-dev/pytest

### Dependency Management
- **Dependabot** - Automated Dependency Updates
  - Documentation: https://docs.github.com/en/code-security/dependabot
  - GitHub Blog: https://github.blog/2020-06-01-keep-all-your-packages-up-to-date-with-dependabot/

### Containerization
- **Docker** - Container Platform
  - Official Site: https://www.docker.com/
  - Documentation: https://docs.docker.com/

- **Docker Buildx** - Docker CLI Plugin
  - Documentation: https://docs.docker.com/buildx/
  - GitHub Repository: https://github.com/docker/buildx

### Version Control and CI/CD
- **GitHub Actions** - CI/CD Platform
  - Documentation: https://docs.github.com/en/actions
  - Marketplace: https://github.com/marketplace?type=actions

- **GitHub CLI** - Command Line Tool
  - Official Site: https://cli.github.com/
  - Documentation: https://cli.github.com/manual/

### Programming Languages
- **Go** - Programming Language
  - Official Site: https://go.dev/
  - Documentation: https://go.dev/doc/

- **Python** - Programming Language
  - Official Site: https://www.python.org/
  - Documentation: https://docs.python.org/

