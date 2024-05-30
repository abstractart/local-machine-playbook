sudo groupadd docker
sudo usermod -aG docker $USER

sudo cp daemon.json /etc/docker/daemon.json