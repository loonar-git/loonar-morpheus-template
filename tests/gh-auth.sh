#!/bin/bash

# Carregar variáveis do arquivo .env
if [ -f ../.env ]; then
  # shellcheck disable=SC2046
  export $(grep -v '^#' ../.env | xargs)
else
  echo "Arquivo .env não encontrado!"
  exit 1
fi

# Loop para perguntar ao usuário até que uma opção válida seja fornecida
while true; do
  echo "Deseja conectar com a SOURCE ou DESTINATION PAT? (Digite '1' para SOURCE ou '2' para DESTINATION)"
  read -r PAT_TYPE

  if [ "$PAT_TYPE" == "1" ]; then
    GH_PAT=$SOURCE_PAT
    break
  elif [ "$PAT_TYPE" == "2" ]; then
    GH_PAT=$DESTINATION_PAT
    break
  else
    echo "Opção inválida! Por favor, digite '1' ou '2'."
  fi
done

# Verificar se GH_PAT foi definido corretamente
if [ -z "$GH_PAT" ]; then
  echo "Erro: GH_PAT não foi definido corretamente."
  exit 1
fi

# Usar o token para autenticação
echo "$GH_PAT" | gh auth login --with-token

echo "GITHIB_PAT definido com sucesso."