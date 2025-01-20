# Pre-requisites install

## pre-commit

Pre-commit is a framework for managing and maintaining multi-language pre-commit hooks. For more information, visit the [official website](https://pre-commit.com).

1. Install pre-commit in your development environment:

    ```bash
    pip install pre-commit
    ```

2. Install the hooks defined in the configuration file:

    ```bash
    pre-commit install
    ```

3. Run the hooks manually to verify they are working correctly:

    ```bash
    pre-commit run --all-files
    ```
