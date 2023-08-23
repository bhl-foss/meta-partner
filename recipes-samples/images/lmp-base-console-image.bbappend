require conf/distro/include/image-license.inc

IMAGE_INSTALL:remove = " jool"
IMAGE_INSTALL:remove = " wpanusb"

CORE_IMAGE_BASE_INSTALL:append = " libqmi"
CORE_IMAGE_BASE_INSTALL:append = " libmbim"

CORE_IMAGE_BASE_INSTALL:append = " crun"
CORE_IMAGE_BASE_INSTALL:append = " docker-ce"
CORE_IMAGE_BASE_INSTALL:append = " python3-docker-compose"
CORE_IMAGE_BASE_INSTALL:append = " podman"
CORE_IMAGE_BASE_INSTALL:append = " podman-compose"
CORE_IMAGE_BASE_INSTALL:append = " k3s"

CORE_IMAGE_BASE_INSTALL:append = " klish2"
CORE_IMAGE_BASE_INSTALL:append = " klish3"
CORE_IMAGE_BASE_INSTALL:append = " tailscale"

CORE_IMAGE_BASE_INSTALL:append:intel-corei7-64 = " ipxe"
