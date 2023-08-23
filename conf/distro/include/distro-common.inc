# Common supported distro features
DISTRO_FEATURES:append = " \
    gobject-introspection-data \
    ipsec \
    ipv4 \
    ipv6 \
    ldconfig \
    overlayfs \
    seccomp \
    selinux \
    usbgadget \
    usbhost \
"
# directfb
# keyboard
# nfs
# smbfs
# xattr
# ld-is-gold
# lto
# ptest

# Common unsupported distro features
DISTRO_FEATURES:remove = " \
    3g \
    zeroconf \
"

# sota is logically a package management feature
IMAGE_FEATURES:remove:sota  = " package-management"

IMAGE_FEATURES:append = " package-management"
IMAGE_FEATURES:append = " debug-tweaks"

IMAGE_FSTYPES:remove = " ostreepush garagesign garagecheck"

PREFERRED_PROVIDER_virtual/runc = "runc-opencontainers"
PREFERRED_PROVIDER_virtual/containerd = "containerd-opencontainers"

OSTREE_RMDIR_HELPER_MSGTYPE = "bbwarn"
