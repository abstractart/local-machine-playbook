#!/usr/bin/env bash
set -eu

title() {
    local color='\033[1;37m'
    local nc='\033[0m'
    printf "\n${color}$1${nc}\n"
}

title "Install pip and Ansible"
wget -O get-pip.py https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py --user && python3 -m pip install --user ansible && rm get-pip.py


title "Install Ansible roles"
roles=(
    'geerlingguy.git'
    'geerlingguy.docker'
    'githubixx.kubectl'
    'geerlingguy.helm'
    'gantsign.minikube'
    'viasite-ansible.zsh'
    'staticdev.pyenv'
)

for role in ${roles[*]}
do
    ansible-galaxy role install  $role
done
ansible-playbook --ask-become-pass playbook.yml

title "Pyenv postInstall step"
echo "source $HOME/pyenv/.pyenvrc" >> .zshrc.local 

title "Setup Git"
git config --global user.name $NAME && git config --global user.email $EMAIL


title "Install build-essential"
sudo apt install build-essential libedit-dev htop -y


title "Setup Docker without sudo"
./docker-without-sudo.sh

title "Fix time sync for dual boot systems"
timedatectl set-local-rtc 1


title "Install Golang"
git clone https://github.com/udhos/update-golang
sudo ./update-golang/update-golang.sh
rm -rf update-golang


title "Install Chromium and Insomnia"
sudo snap install chromium
sudo snap install insomnia 


title "Install Codium and extensions"
sudo snap install codium --classic && ./codium-extensions.sh

title "Finished! Please, restart your shell."
