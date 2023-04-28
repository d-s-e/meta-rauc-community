require conf/machine/include/ti-base.inc

IMAGE_FSTYPES = "wic.bz2 wic.bmap squashfs ext4"
IMAGE_FSTYPES += " wic"

WKS_FILE = "ti-dual-image.wks.in"
IMAGE_BOOT_FILES += "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
