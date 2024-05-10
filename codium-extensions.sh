#!/usr/bin/env bash
set -eu

extensions=(
    'eamodio.gitlens'
    'editorconfig.editorconfig'
    'golang.go'
    'ms-azuretools.vscode-docker'
    'ms-kubernetes-tools.vscode-kubernetes-tools'
    'ms-python.debugpy'
    'ms-python.python'
    'pomdtr.excalidraw-editor'
)

for ext in ${extensions[*]}
do
    codium --install-extension $ext
done
