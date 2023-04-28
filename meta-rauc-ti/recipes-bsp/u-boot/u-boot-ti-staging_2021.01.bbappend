FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "  \
    file://boot.cmd.in \
    file://fw_env.config \
    file://0001_additional_defconfig_for_fat.patch \
"

require conf/machine/include/ti-base.inc

DEPENDS += "u-boot-mkimage-native"

DEPENDS += "bc-native dtc-native swig-native python3-native flex-native bison-native"
EXTRA_OEMAKE += 'HOSTLDSHARED="${BUILD_CC} -shared ${BUILD_LDFLAGS} ${BUILD_CFLAGS}"'

do_configure:append() {
    sed -e 's/@@KERNEL_IMAGETYPE@@/${KERNEL_IMAGETYPE}/' \
    -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
    "${WORKDIR}/boot.cmd.in" > "${WORKDIR}/boot.cmd"
}

do_compile:append() {
    ${B}/tools/mkimage -A ${UBOOT_ARCH} -T script -C none -d "${WORKDIR}/boot.cmd" ${WORKDIR}/${UBOOT_ENV_BINARY}
}

do_install:append() {
    install -d ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
}

