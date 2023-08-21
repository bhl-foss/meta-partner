#!/bin/bash -x

# https://www.howtogeek.com/787217/how-to-edit-environment-variables-on-windows-10-or-11/
# Windows Environment WSLENV=USERNAME:USERPROFILE/p

if [ -z "${USERNAME}" ]; then
echo "Set windows environment variable WSLENV to include USERNAME"
exit 1
fi

if [ -z "${USERPROFILE}" -o ! -d "${USERPROFILE}" ]; then
echo "Set windows environment variable WSLENV to include USERPROFILE/p"
exit 1
fi

cat > $USERPROFILE/.wslconfig <<_EOF_
[wsl2]
#swap=8GB
#memory=16GB
#processors=16
_EOF_

sudo "cat > /etc/wsl.conf <<_EOF_
[boot]
systemd=true
[automount]
options="uid=1000,gid=1000,metadata,case=off"
_EOF_
"

sudo "cat > /etc/sudoers.d/local <<_EOF_
$LOGNAME ALL=(ALL:ALL) NOPASSWD: ALL
_EOF_
"

mkdir -p $USERPROFILE/.config
ln -sf $USERPROFILE/.config ~/.config

mkdir -p $USERPROFILE/.gnupg
ln -sf $USERPROFILE/.gnupg ~/.gnupg

mkdir -p $USERPROFILE/.local
ln -sf $USERPROFILE/.local ~/.local

mkdir -p $USERPROFILE/.ssh
ln -sf $USERPROFILE/.ssh ~/.ssh

echo "Command prompt to shutdown WSL for changes 'wsl --shutdown'"
