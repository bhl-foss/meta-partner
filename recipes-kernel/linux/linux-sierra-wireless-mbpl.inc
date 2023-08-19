FILESEXTRAPATHS:prepend := "${THISDIR}/sierra-wireless-mbpl:"

# Mobile Broadband Package for Linux
# May 06, 2023 - Author: Sierra Wireless - Version R32.0.23 B5296
# https://source.sierrawireless.com/resources/airprime/software/mbpl/mbpl-software-latest/

SRC_URI:append = " \
    file://qcserial.c \
    file://qmi_wwan.c \
    file://usb_wwan.c \
    file://usb-wwan.h \
    file://kernel-wwan.cfg \
"

do_configure:prepend () {
    install -D ${WORKDIR}/qcserial.c ${S}/drivers/usb/serial/qcserial.c
    install -D ${WORKDIR}/qmi_wwan.c ${S}/drivers/net/usb/qmi_wwan.c
    install -D ${WORKDIR}/usb_wwan.c ${S}/drivers/usb/serial/usb_wwan.c
    install -D ${WORKDIR}/usb-wwan.h ${S}/drivers/usb/serial/usb-wwan.h
}
