FILESEXTRAPATHS:prepend := "${THISDIR}/kernel-selinux:"

SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'file://kernel-selinux.cfg', '', d)}"
