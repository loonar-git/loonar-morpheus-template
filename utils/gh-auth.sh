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
  echo "Options PAT:"
  echo "[1] SOURCE"
  echo "[2] DESTINATION"
  echo "[3] YOUR"
  read -r PAT_TYPE

  if [ "$PAT_TYPE" == "1" ]; then
    GH_PAT=$SOURCE_PAT
    break
  elif [ "$PAT_TYPE" == "2" ]; then
    GH_PAT=$DESTINATION_PAT
    break
  elif [ "$PAT_TYPE" == "3" ]; then
    GH_PAT=$YOUR_PAT
    break
  else
    echo "Invalid option"
  fi
done

# Verificar se GH_PAT foi definido corretamente
if [ -z "$GH_PAT" ]; then
  echo "Error: GH_PAT has not been defined correctly."
  exit 1
fi

# Usar o token para autenticação
echo "$GH_PAT" | gh auth login --with-token

echo "Githib_pat defined successfully."