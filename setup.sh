#!/usr/bin/env bash
set -eu

title() {
    local color='\033[1;37m'
    local nc='\033[0m'
    printf "\n${color}$1${nc}\n"
}

sudo apt install pipx -y

title "Install pip and Ansible"
pipx install --include-deps ansible

title "Install build-essential"
sudo apt-get update && sudo apt-get install make build-essential libssl-dev \
    zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

title "Install Ansible roles"
roles=(
    'geerlingguy.git'
    'geerlingguy.docker'
    'githubixx.kubectl'
    'geerlingguy.helm'
    'gantsign.minikube'
    'viasite-ansible.zsh'
)

for role in ${roles[*]}
do
    ansible-galaxy role install  $role
done
ansible-playbook --ask-become-pass playbook.yml

title "Pyenv post-install step"
echo "source $HOME/pyenv/.pyenvrc" >> .zshrc.local 

title "Setup Git"
git config --global user.name $NAME && git config --global user.email $EMAIL

title "Setup Docker"
./docker-post-install.sh

title "Fix time sync for dual boot systems"
timedatectl set-local-rtc 1

read

title "Install Golang"
git clone https://github.com/udhos/update-golang
sudo ./update-golang/update-golang.sh
rm -rf update-golang


title "Install Chromium and Insomnia"
sudo snap install chromium
sudo snap install insomnia 
sudo snap install golangci-lint --classic
sudo snap install htop

title "Install Codium and extensions"
sudo snap install codium --classic && ./codium-extensions.sh

title "Finished! Please, restart your shell."

# sudo sysctl -w kernel.apparmor_restrict_unprivileged_userns=0
# sudo add-apt-repository universe
# sudo apt install libfuse2t64
