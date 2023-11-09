#
# Copyright (C) 2022 ImmortalWrt.org
#
# Copyright (C) 2023 LALA <maoerpet@foxmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=arm-trusted-firmware-rockchip-vendor
PKG_VERSION:=b4558da0860ca48bf1a571dd33ccba580b9abe23

PKG_SOURCE:=rk-bin-$(PKG_VERSION).zip
PKG_SOURCE_URL=https://codeload.github.com/rockchip-linux/rkbin/zip/$(PKG_VERSION)
PKG_HASH:=039f0f72d0dd179487b5d4b135d13684b220f3d81fa7308a34431a86701f69c6

include $(INCLUDE_DIR)/package.mk

define Package/arm-trusted-firmware-rockchip-vendor
    SECTION:=boot
    CATEGORY:=Boot Loaders
    TITLE:=ARM Trusted Firmware for Rockchip 35xx
endef

define Package/arm-trusted-firmware-rk3566
    $(Package/arm-trusted-firmware-rockchip-vendor)
    DEPENDS:=@TARGET_rockchip
    VARIANT:=rk3566
endef

define Package/arm-trusted-firmware-rk3568
    $(Package/arm-trusted-firmware-rockchip-vendor)
    DEPENDS:=@TARGET_rockchip
    VARIANT:=rk3568
endef

define Build/Configure
	$(SED) 's,$$$$(PKG_BUILD_DIR),$(PKG_BUILD_DIR),g' $(PKG_BUILD_DIR)/trust.ini
	$(SED) 's,$$$$(VARIANT),$(BUILD_VARIANT),g' $(PKG_BUILD_DIR)/trust.ini
	$(call Build/Configure/Default)
endef

define Build/InstallDev
	$(CURDIR)/pack-firmware.sh $(BUILD_VARIANT) '$(PKG_BUILD_DIR)' '$(STAGING_DIR_IMAGE)'
endef

define Package/arm-trusted-firmware-rk3566/install
endef

define Package/arm-trusted-firmware-rk3568/install
endef

$(eval $(call BuildPackage,arm-trusted-firmware-rk3566))
$(eval $(call BuildPackage,arm-trusted-firmware-rk3568))
