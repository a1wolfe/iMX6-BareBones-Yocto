FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://imx6ull-barebones.dts"

do_patch:append() {
cp ${WORKDIR}/sources/imx6ull-barebones.dts \
    ${S}/arch/arm/boot/dts/nxp/imx/imx6ull-barebones.dts
}
