require kernel-sierra-wireless-mbpl.inc
require ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'kernel-selinux.inc', '', d)}
