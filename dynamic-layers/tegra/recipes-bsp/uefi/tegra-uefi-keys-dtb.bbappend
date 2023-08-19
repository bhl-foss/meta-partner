inherit l4t_bsp

require recipes-bsp/tegra-binaries/tegra-binaries-${L4T_VERSION}.inc
require recipes-bsp/tegra-binaries/tegra-shared-binaries.inc

PV = "${L4T_VERSION}"
PR = "r0"

DEPENDS = "dtc-native efitools-native python3-native tegra-binaries util-linux-native"

do_configure () {
    install -t ${B} \
        ${UEFI_SIGN_KEYDIR}/PK.key ${UEFI_SIGN_KEYDIR}/PK.crt \
        ${UEFI_SIGN_KEYDIR}/KEK.key ${UEFI_SIGN_KEYDIR}/KEK.crt \
        ${UEFI_SIGN_KEYDIR}/DB.key ${UEFI_SIGN_KEYDIR}/DB.crt
}

do_compile () {
    cat > ${B}/uefi_keys.conf <<EOF
UEFI_PK_KEY_FILE="PK.key";
UEFI_PK_CERT_FILE="PK.crt";
UEFI_KEK_KEY_FILE="KEK.key";
UEFI_KEK_CERT_FILE="KEK.crt";
UEFI_DB_1_KEY_FILE="DB.key";
UEFI_DB_1_CERT_FILE="DB.crt";
EOF
    ${S}/tools/gen_uefi_default_keys_dts.sh ${B}/uefi_keys.conf
}

do_install[noexec] = "1"

do_deploy () {
    install -d ${DEPLOYDIR}
    install -m 0644 -t ${DEPLOYDIR} ${B}/UefiDefaultSecurityKeys.dtbo
}
