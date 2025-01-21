#!/bin/bash

# Delete local tags
git tag -l | xargs git tag -d

# Delete remote tags
git ls-remote --tags origin | awk '{print $2}' | grep -v '{}' | sed 's#refs/tags/##' | xargs -I {} git push origin :refs/tags/{}

# Delete all releases
gh release list --json tagName --jq '.[].tagName' | while read tag; do gh release delete "$tag" -y; done



git tag v0.0.0 -m "WIP"
git push origin v0.0.0

# Função para verificar se há workflows em execução
check_workflows() {
  local owner="loonar-git"
  local repo="loonar-morpheus-template"

  local workflows
  workflows=$(gh run list -R "$owner/$repo" --status in_progress --json status -q '.[] | select(.status=="in_progress")')

  if [ -n "$workflows" ]; then
    return 1
  else
    return 0
  fi
}

# Aguardar até que todos os workflows sejam concluídos
while ! check_workflows; do
  echo "Aguardando conclusão dos workflows ativos..."
  sleep 10
done

# Criar um novo release com o nome WIP para a tag v0.0.0 como pre-release
gh release create v0.0.0 --title "WIP" --generate-notes #--prerelease --draft