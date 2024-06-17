#!/usr/bin/env bash
set -eu

extensions=(
    'donjayamanne.githistory'
    'mhutchie.git-graph'
    'waderyan.gitblame'
    'vivaxy.vscode-conventional-commits'

    'editorconfig.editorconfig'
    
    
    'ms-azuretools.vscode-docker'
    'ms-kubernetes-tools.vscode-kubernetes-tools'
    
    'golang.go'
    'ms-python.debugpy'
    'ms-python.python'
    
    'pomdtr.excalidraw-editor'


    'vscode-clangd'
    'vscode-lldb'
)

for ext in ${extensions[*]}
do
    codium --install-extension $ext
done
