#!/bin/bash
# Copyright (C) 2021 ImmortalWrt.org

BUILD_VARIANT="$1"
PKG_BUILD_DIR="$2"
STAGING_DIR_IMAGE="$3"

case "$BUILD_VARIANT" in
"rk3566")
	ATF="rk35/rk3568_bl31_v1.43.elf"
	DDR="rk35/rk3566_ddr_1056MHz_v1.18.bin"
	;;
"rk3568")
	ATF="rk35/rk3568_bl31_v1.43.elf"
	DDR="rk35/rk3568_ddr_1560MHz_v1.18.bin"
	;;
*)
	echo -e "Not compatible with your platform: $BUILD_VARIANT."
	exit 1
	;;
esac

mkdir -p "$STAGING_DIR_IMAGE"
cp -fp "$PKG_BUILD_DIR/bin/$ATF" "$STAGING_DIR_IMAGE"/
cp -fp "$PKG_BUILD_DIR/bin/$DDR" "$STAGING_DIR_IMAGE"/
