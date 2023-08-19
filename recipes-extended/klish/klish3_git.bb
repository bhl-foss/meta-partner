FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SUMMARY = "Command line interface"
DESCRIPTION = "The klish is a framework for implementing a CISCO-like CLI on a UNIX systems. It is configurable by XML files."

# Add .xml descriptions with klish3_%.bbappend in appropriate rescipe folders FILESEXTRAPATHS

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENCE;md5=763c2d89173e7008fab9b7ecf2605ab5"

SRC_URI = "\
    git://github.com/rgl-os-mirrors/klish.git;branch=master;protocol=https \
    file://klishd.conf \
    file://klishd.service \
    "

SRCREV = "${AUTOREV}"
PV = "3.0+git${SRCPV}"

S = "${WORKDIR}/git"

DEPENDS = "faux"

RDEPENDS:${PN} = "faux"

inherit autotools-brokensep extrausers gettext systemd

EXTRA_OECONF = ""

EXTRA_OEMAKE = "DESTDIR=${D}"

do_install:append () {
    install -D -m 0644 ${WORKDIR}/klishd.conf ${D}${sysconfdir}/klish/klishd.conf
    install -D -m 0644 ${WORKDIR}/klishd.service ${D}${systemd_unitdir}/system/klishd.service
}

SYSTEMD_SERVICE:${PN} = "klishd.service"
SYSTEMD_AUTO_ENABLE:${PN} = "disable"

# NO SYMLINKS for ${libdir}
FILES:${PN}:append = "${bindir} ${datadir} ${sysconfdir} ${systemd_unitdir}/system \
    ${libdir}/libklish.so.3.0.0 ${libdir}/libtinyrl.so.3.0.0 \
    ${libdir}/klish/dbs/kdb-ischeme.so ${libdir}/klish/dbs/kdb-ischeme.so \
    ${libdir}/klish/plugins/kplugin-klish.so ${libdir}/klish/plugins/kplugin-script.so \
    "

# ONLY SYMLINKS for ${libdir}
FILES:${PN}-dev:append = "${includedir} \
    ${libdir}/libklish.so ${libdir}/libklish.so.3 ${libdir}/libtinyrl.so ${libdir}/libtinyrl.so.3 \
    "

# ONLY STATIC LIBS for ${libdir}
FILES:${PN}-staticdev:append = "${includedir} \
    ${libdir}/*.a ${libdir}/*.la \
    ${libdir}/klish/dbs/*.a ${libdir}/klish/dbs/*.la \
    ${libdir}/klish/plugins/*.a ${libdir}/klish/plugins/*.la \
    "
