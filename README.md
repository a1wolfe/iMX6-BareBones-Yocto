# iMX6 Bare Bones - Yocto Project

An open source development board using the NXP i.MX 6ULL application processor.

No Bare Bones PCBAs have been built yet, so this image has not been tested.

## Related Repositories
PCBA Design: https://github.com/a1wolfe/iMX6-BareBones

## Structure
This Yocto project was created using NXP's reference designs. The machine configuration "imx6ull14x14evk" and making modifications for the iMX6ULL Bare Bones design.

The custom layer meta-imx6ull-barebones contains the append recipe and dts files.

The images directory contains the ".wic.zst" which can be saved to an SD card for boot.
