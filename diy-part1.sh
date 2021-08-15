#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# 清除旧版argon主题并拉取最新版
rm -rf package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

# ChinaDNS & DNS-Forwarder
git clone https://github.com/aa65535/openwrt-chinadns.git package/chinadns
git clone https://github.com/aa65535/openwrt-dns-forwarder.git package/dns-forwarder
git clone https://github.com/aa65535/openwrt-dist-luci.git package/openwrt-dist-luci

# Remove UnblockNeteaseMusicGo upx commands
sed -i "/upx/d" package/lean/UnblockNeteaseMusicGo/Makefile || true
