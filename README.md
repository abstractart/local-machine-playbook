# Prepare your laptop for Development in one shell command!

This repo provides ansible playbook with additional scripts which prepares your fresh Ubuntu OS in couple of minutes.
## Playbook Includes:
- Ansible (for tools install) - https://github.com/ansible/ansible
- Git - https://github.com/geerlingguy/ansible-role-git


Languages:
- Golang - https://github.com/udhos/update-golang
- Python with Pyenv


Runtime and tools:
- Docker - https://github.com/geerlingguy/ansible-role-docker
- Kubernetes (minikube) = https://github.com/gantsign/ansible_role_minikubes
- Kubectl - https://github.com/githubixx/ansible-role-kubectl
- Helm - https://github.com/geerlingguy/ansible-role-helm


Coding Tools:
- Codium (VS Code without MS branding/telemetry/licensing) - https://github.com/VSCodium/vscodium
- Codium extensions for Python, Golang, K8s and Docker
- ZSH on steroids - https://github.com/viasite-ansible/ansible-role-zsh

## Quick start
Just run in terminal:
```
NAME="<Your name (for git config)>" EMAIL="(email for git config)" ./setup.sh
```
Script asks you to password for system-wide installation of utilities

