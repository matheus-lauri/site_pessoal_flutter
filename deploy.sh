#!/bin/bash
set -e

# Gera o build do Flutter Web
echo "Gerando build do Flutter Web..."
flutter build web

# Cria o branch gh-pages se não existir
git branch | grep gh-pages || git checkout --orphan gh-pages

# Limpa o diretório (exceto o build)
git rm -rf . --ignore-unmatch
cp -r build/web/* .

# Adiciona e faz commit dos arquivos
git add .
git commit -m "Deploy Flutter Web to GitHub Pages" || echo "Nada para commitar"

# Faz push forçado para o branch gh-pages
git push origin gh-pages --force

# Volta para o branch principal
git checkout main

echo "Deploy concluído! Configure o GitHub Pages para usar o branch gh-pages e a pasta root."
