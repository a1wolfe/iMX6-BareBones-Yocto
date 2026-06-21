FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://imx6ull-barebones.dts"

do_configure:prepend() {
    cp ${WORKDIR}/sources/imx6ull-barebones.dts ${S}/arch/arm/dts/imx6ull-barebones.dts
    echo 'dtb-$(CONFIG_MX6ULL) += imx6ull-barebones.dtb' >> ${S}/arch/arm/dts/Makefile
    sed -i 's/CONFIG_DEFAULT_DEVICE_TREE="imx6ull-14x14-evk"/CONFIG_DEFAULT_DEVICE_TREE="imx6ull-barebones"/' ${S}/configs/mx6ull_14x14_evk_defconfig
    sed -i 's/CONFIG_DEFAULT_FDT_FILE=""/CONFIG_DEFAULT_FDT_FILE="imx6ull-barebones.dtb"/' ${S}/configs/mx6ull_14x14_evk_defconfig
}

UBOOT_DTB_NAME = "imx6ull-barebones.dtb"
