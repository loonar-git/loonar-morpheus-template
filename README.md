<div align="center" id="top">
  <img src="./assets/images/loonarbr_cover.jpeg" alt="Loonar cover art" />

  &#xa0;

</div>

# Loonar Morpheus Template


<p align="center">

  <img alt="Github language count" src="https://img.shields.io/github/languages/count/loonar-morpheus/{{REPOSITORY_NAME}}?color=56BEB8">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/loonar-morpheus/{{REPOSITORY_NAME}}?color=56BEB8">

  <img alt="License" src="https://img.shields.io/github/license/loonar-morpheus/{{REPOSITORY_NAME}}?color=56BEB8">

  <img alt="Github issues" src="https://img.shields.io/github/issues/loonar-morpheus/{{REPOSITORY_NAME}}?color=56BEB8" />
  <img alt="Github forks" src="https://img.shields.io/github/forks/loonar-morpheus/{{REPOSITORY_NAME}}?color=56BEB8" />

  <img alt="Github stars" src="https://img.shields.io/github/stars/loonar-morpheus/{{REPOSITORY_NAME}}?color=56BEB8" />
</p>

<!-- Status -->

<!-- <h4 align="center"> 
  🚧  Loonar Morpheus Template 🚀 Under construction...  🚧
</h4> 

<hr> -->

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0;
  <a href="#sparkles-features">Features</a> &#xa0; | &#xa0;
  <a href="#rocket-technologies">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-starting">Starting</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/loonar-morpheus" target="_blank">Author</a>
</p>

<br>

## :dart: About

This template is designed for creating tasks to be executed by Morpheus Data, providing a standardized structure for validating scripts in Bash, Python, and Terraform. The template implements automatic validations and development best practices to ensure code quality and consistency.

## :sparkles: Features

:heavy_check_mark: Automatic validation of Bash, Python, and Terraform scripts;\
:heavy_check_mark: Standardized development structure;\
:heavy_check_mark: Integrated CI/CD practices documentation;

## :rocket: Technologies

The following tools were used in this project:

- [Visual Studio Code](https://code.visualstudio.com/)
- [Development Container](https://containers.dev/)
- [Python](https://python.org/)
- [Bash](https://www.gnu.org/software/bash/)
- [Terraform](https://www.terraform.io/)

## :white_check_mark: Requirements

Before starting :checkered_flag:, you need to have [Git](https://git-scm.com) installed.

## :checkered_flag: Starting

### Creating your repository

1. Click on "Use this template" button at the top of this repository
2. Choose "Create a new repository"
3. Fill in the repository name and description
4. Choose the repository visibility (public or private)
5. Click on "Create repository from template"

### Using your repository

```bash
# Clone your new repository
$ git clone https://github.com/loonar-morpheus/your-repository-name

# Access the project directory
$ cd your-repository-name

# Directory structure
.
├── src/           # Scripts directory (only .sh, .py, .tf files)
└── docs/          # Project documentation (markdown files and images)
    └── ci-cd/     # Validation and technologies documentation

# Development workflow
1. Create your scripts in the /src directory
2. Follow the file extension rules (.sh, .py, .tf)
3. Update documentation in /docs if needed
4. Commit and push your changes
5. CI/CD will automatically validate your scripts

# Important guidelines
- Scripts must be created only in the /src directory
- Creation of subdirectories in /src is not allowed
- Only files with .sh, .py, and .tf extensions are allowed in /src
- In /docs, only markdown files and images are allowed
- Check /docs/ci-cd for validation information
```

### Development Environment Options

#### Using GitHub Codespaces

1. Click on the "Code" button in your repository
2. Select the "Codespaces" tab
3. Click on "Create codespace on main"
4. Wait for the environment to be built and ready to use
5. Start coding! The environment will have all required tools pre-installed

#### Using VS Code with Dev Containers

Prerequisites:
- [VS Code](https://code.visualstudio.com/) installed
- [Docker](https://www.docker.com/) installed and running
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed in VS Code

Steps:
1. Clone your repository locally
2. Open the repository in VS Code
3. When prompted "Reopen in Container", click "Yes"
   - Alternatively, press `F1`, type "Dev Containers: Reopen in Container"
4. Wait for the container to build and start
5. Start coding! The environment will have all required tools pre-installed

Both environments provide:
- Pre-configured development environment
- Required tools and extensions installed
- Consistent development experience across different machines
- Isolated environment for your project

```bash
# Development workflow remains the same in both environments
1. Create your scripts in the /src directory
2. Follow the file extension rules (.sh, .py, .tf)
3. Update documentation in /docs if needed
4. Commit and push your changes
5. CI/CD will automatically validate your scripts
```

## :memo: License

This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file.

Made with :heart: by <a href="https://loonar.cloud" target="_blank">Loonar Cloud</a> by  [@sandrociceros-loonar](https://github.com/sandrociceros-loonar)

&#xa0;

<a href="#top">Back to top</a>
