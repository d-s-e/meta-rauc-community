FILESEXTRAPATHS:prepend:ti-soc := "${THISDIR}/files:"
SRC_URI:append:ti-soc = " file://ti-rauc.rules"

do_install:append:ti-soc() {
    install -m 0644 ${WORKDIR}/ti-rauc.rules ${D}${sysconfdir}/udev/mount.blacklist.d/
}
