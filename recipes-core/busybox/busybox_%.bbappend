FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://busybox.conf file://busybox.cfg \
    ${@bb.utils.contains_any('DISTRO_FEATURES', 'pam', 'file://busybox-pam.cfg', '', d)} \
    ${@bb.utils.contains_any('DISTRO_FEATURES', 'selinux', 'file://busybox-selinux.cfg', '', d)} \
    "

DEPENDS:append = " \
    ${@bb.utils.contains_any('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
    ${@bb.utils.contains_any('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)} \
    "

RDEPENDS:${PN}:append = "\
    ${@bb.utils.contains_any('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
    ${@bb.utils.contains_any('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)} \
    "

FILES:${PN}:append = " ${sysconfdir}/busybox.conf"

FILES:${PN}-syslog:append = " ${systemd_system_unitdir}/busybox-syslog.service"

SYSTEMD_AUTO_ENABLE:${PN}-syslog = "disable"

BUSYBOX_SPLIT_SUID = "0"

do_install:append() {
    install -D -m 0600 ${WORKDIR}/busybox.conf ${D}${sysconfdir}/busybox.conf
}
