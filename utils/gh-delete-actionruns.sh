#!/bin/bash

# Informational banner
echo "*********************************************************"
echo "* This script will delete all GitHub Actions runs       *"
echo "* for the current remote repository. Make sure you want *"
echo "* to proceed with this action, as it cannot be undone.  *"
echo "*********************************************************"

# Confirmation prompt in red color
echo -e "\033[31mDo you want to continue? (y/n):\033[0m"
read -rp "confirm: " confirm
if [[ $confirm != [yY] ]]; then
    echo "Action canceled by user."
    exit 1
fi

# Check if gh and jq are installed
if ! command -v gh &> /dev/null || ! command -v jq &> /dev/null; then
    echo "Error: gh and jq are required but not installed."
    exit 1
fi

# Get the URL of the remote repository
REMOTE_URL=$(git config --get remote.origin.url)
# Extract the owner and repository name from the remote URL
REPO_INFO=$(echo "$REMOTE_URL" | sed -n 's#.*github.com[:/]\(.*\)\.git#\1#p')
OWNER=$(echo "$REPO_INFO" | cut -d'/' -f1)
REPO=$(echo "$REPO_INFO" | cut -d'/' -f2)

# API URL to list workflow runs
API_URL="https://api.github.com/repos/$OWNER/$REPO/actions/runs"

# Function to delete runs
delete_runs() {
    RUNS=$(gh api "$API_URL" | jq -r '.workflow_runs[] | .id')

    if [ -z "$RUNS" ]; then
        echo "No workflow runs found."
        exit 0
    fi

    for RUN_ID in $RUNS; do
        if gh api -X DELETE "repos/$OWNER/$REPO/actions/runs/$RUN_ID"; then
            echo "Deleted run ID: $RUN_ID"
        else
            echo "Failed to delete run ID: $RUN_ID"
        fi
    done

    # Verify if runs are deleted
    REMAINING_RUNS=$(gh api "$API_URL" | jq -r '.workflow_runs[] | .id')
    if [ -n "$REMAINING_RUNS" ]; then
        echo "Some runs were not deleted. Retrying..."
        delete_runs
    else
        echo "All runs deleted successfully."
    fi
}

# Execute the delete function
delete_runs