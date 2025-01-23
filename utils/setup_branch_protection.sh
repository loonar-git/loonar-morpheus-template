#!/bin/bash

# Obtém o nome do repositório atual
REPO="${GITHUB_REPOSITORY}"

# Configura a proteção do branch main
gh api \
  --method PUT \
  "/repos/${REPO}/branches/main/protection" \
  --field required_status_checks='{"strict":true,"contexts":["validate-directories"]}' \
  --field enforce_admins=false \
  --field required_pull_request_reviews='{"dismissal_restrictions":{},"dismiss_stale_reviews":true,"require_code_owner_reviews":true,"required_approving_review_count":1}' \
  --field restrictions=null

echo "✅ Main branch protection configured!" 