FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = " file://imx6ull-barebones.dts"
do_configure:prepend() {
    cp ${WORKDIR}/sources/imx6ull-barebones.dts ${S}/arch/arm/dts/imx6ull-barebones.dts
    echo 'dtb-$(CONFIG_MX6ULL) += imx6ull-barebones.dtb' >> ${S}/arch/arm/dts/Makefile
    sed -i 's/CONFIG_DEFAULT_DEVICE_TREE="imx6ull-14x14-evk"/CONFIG_DEFAULT_DEVICE_TREE="imx6ull-barebones"/' ${S}/configs/mx6ull_14x14_evk_defconfig
    echo 'CONFIG_DEFAULT_FDT_FILE="imx6ull-barebones.dtb"' >> ${S}/configs/mx6ull_14x14_evk_defconfig
    echo 'CONFIG_SPI_FLASH_ATMEL=y' >> ${S}/configs/mx6ull_14x14_evk_defconfig
    sed -i 's/{ INFO("at25sl321",/{ INFO("at25sf321b",\t0x1f8701, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_QUAD_READ) },\n\t{ INFO("at25sl321",/' \
        ${S}/drivers/mtd/spi/spi-nor-ids.c
}
UBOOT_DTB_NAME = "imx6ull-barebones.dtb"
