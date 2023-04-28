FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append := "  \
	file://system.conf \
	file://ca.cert.pem \
"

# additional dependencies required to run RAUC on the target
# RDEPENDS:${PN} += "u-boot-fw-utils u-boot-env"
RDEPENDS:${PN} += "u-boot-fw-utils"

RAUC_KEYRING_FILE = "ca.cert.pem"
