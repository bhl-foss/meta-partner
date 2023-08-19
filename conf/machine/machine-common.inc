PREFERRED_PROVIDER_virtual/runc = "runc-opencontainers"
PREFERRED_PROVIDER_virtual/containerd = "containerd-opencontainers"

DISTRO_FEATURES:append = " ld-is-gold lto ldconfig ptest"
DISTRO_FEATURES:append = " gobject-introspection-data"
DISTRO_FEATURES:append = " ipsec ipv4 ipv6"
DISTRO_FEATURES:append = " keyboard directfb"
DISTRO_FEATURES:append = " usbgadget usbhost"
DISTRO_FEATURES:append = " xattr"
DISTRO_FEATURES:append = " seccomp overlayfs nfs smbfs"

DISTRO_FEATURES:remove = " 3g zeroconf"

MACHINE_FEATURES:append = " efi"
MACHINE_FEATURES:append = " bluetooth wifi"
MACHINE_FEATURES:append = " keyboard screen touchscreen serial rtc"
MACHINE_FEATURES:append = " usbgadget usbhost"

MACHINE_FEATURES:remove = " 3g pcbios phone pcmcia"

KERNEL_MODULE_AUTOLOAD += "kernel-module-usb-wwan"
KERNEL_MODULE_AUTOLOAD += "kernel-module-qmi-wwan"
KERNEL_MODULE_AUTOLOAD += "kernel-module-qcserial"

EXTRA_IMAGE_FEATURES:append = " package-management"
EXTRA_IMAGE_FEATURES:append = " debug-tweaks"
