#!/bin/bash

# shellcheck disable=SC1091
source "../.env"

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

echo "${GH_PAT}" | gh auth login --with-token