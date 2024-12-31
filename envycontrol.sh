URL="https://github.com/bayasdev/envycontrol/releases/download/v3.5.1/python3-envycontrol_3.5.1-1_all.deb"

TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" $URL &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"
