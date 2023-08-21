DESCRIPTION = "The easiest, most secure way to use WireGuard and 2FA."

GO_IMPORT = "github.com/tailscale/tailscale"

SRC_URI = "git://${GO_IMPORT};branch=main;protocol=https;src/${GO_IMPORT}"
SRCREV = "${AUTOREV}"

LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=a672713a9eb730050e491c92edf7984d"

inherit go-mod systemd

do_install:append() {
    install -D -m 0644 ${S}/src/${GO_IMPORT}/cmd/tailscaled/tailscaled.service ${D}${systemd_system_unitdir}/tailscaled.service
}

SYSTEMD_SERVICE:${PN} = "tailscaled.service"

FILES:${PN} += "${GOBIN_FINAL} ${systemd_system_unitdir}"

INSANE_SKIP:${PN}-dev += "file-rdeps"
