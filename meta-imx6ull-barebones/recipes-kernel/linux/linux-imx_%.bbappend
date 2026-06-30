FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://imx6ull-barebones.dts file://qspi.cfg"
do_patch:append() {
    cp ${WORKDIR}/sources/imx6ull-barebones.dts \
        ${S}/arch/arm/boot/dts/nxp/imx/imx6ull-barebones.dts
    sed -i '/SNOR_ID(0x1f, 0x87, 0x01)/{n;n;s/SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ/SECT_4K/}' \
        ${S}/drivers/mtd/spi-nor/atmel.c
}
