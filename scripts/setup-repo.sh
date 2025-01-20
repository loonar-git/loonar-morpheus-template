#!/usr/bin/env bash

gh auth login

gh api -X PUT \
  -H "Accept: application/vnd.github.v3+json" \
  /repos/:owner/:repo/branches/main/protection \
  -f required_status_checks.contexts='["lint", "secrets", "vulnerabilities"]' \
  -f enforce_admins=true \
  -f required_pull_request_reviews.dismiss_stale_reviews=true \
  -f restrictions.users='[]' \
  -f restrictions.teams='[]'