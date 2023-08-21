do_install:append () {
    bbnote DISTRO_FEATURES usrmerge
    rm -fr ${D}/opt
    install -d ${D}${sysconfdir}/tmpfiles.d/
    cat > ${D}${sysconfdir}/tmpfiles.d/10-usrmerge-${PN}.conf <<_EOF_
d /opt/cni - - - - -
L+ /opt/cni/bin - - - - ${libexecdir}/cni
_EOF_
}

INSANE_SKIP:${PN}:append = " textrel"

FILES:${PN}:remove = " /opt/cni/bin"
FILES:${PN}:append = " ${sysconfdir}/tmpfiles.d"
