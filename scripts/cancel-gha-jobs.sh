#!/bin/bash

# Verifique se a GitHub CLI está instalada
if ! command -v gh &> /dev/null
then
    echo "GitHub CLI could not be found. Please install GitHub CLI from https://cli.github.com/"
    exit 1
fi

# Autentique-se com a GitHub CLI
# Verifique o status de autenticação do GitHub CLI 
if ! gh auth status &>/dev/null; then
    gh auth login
fi


REPO=$(gh repo view --json nameWithOwner --jq '.nameWithOwner')

# Listar todos os workflows em execução
running_jobs=$(gh run list --repo $REPO --status in_progress --json databaseId --jq '.[].databaseId')

# Cancelar todos os workflows em execução
for job in $running_jobs
do
    echo "Cancelling job ID: $job"
    gh run cancel --repo your-org/your-repo $job 
done

echo "All running jobs have been cancelled."
