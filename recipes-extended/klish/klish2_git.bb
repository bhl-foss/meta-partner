FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SUMMARY = "Command line interface"
DESCRIPTION = "The klish is a framework for implementing a CISCO-like CLI on a UNIX systems. It is configurable by XML files."

# Add .xml descriptions with klish2_%.bbappend in appropriate rescipe folders FILESEXTRAPATHS

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENCE;md5=763c2d89173e7008fab9b7ecf2605ab5"

SRC_URI = "git://github.com/brainhoard-lmp-mirrors/klish.git;branch=2.2;protocol=https"

SRCREV = "${AUTOREV}"
PV = "2.2+git${SRCPV}"

S = "${WORKDIR}/git"

DEPENDS = "libxml2"

RDEPENDS:${PN} = "libxml2"

inherit autotools extrausers systemd

EXTRA_OECONF = ""

EXTRA_OEMAKE = "DESTDIR=${D}"

do_install:append () {

}

FILES:${PN}:append = " ${libdir}"
