#!/usr/bin/env bash

set -xe

PACKAGES=(
	fcitx5
	fcitx5-chinese-addons
	fcitx5-configtool
	fcitx5-gtk
	fcitx5-mozc
	fcitx5-qt
	fcitx5-table-extra
	fcitx5-table-other
)

grep kde-desktop < <(sudo dnf group list --installed)
if [ $? -ne 0 ]; then
	PACKAGES+=(fcitx5-autostart)
else
	PACKAGES+=(kcm-fcitx5)
fi

sudo dnf install --skip-unavailable ${PACKAGES[@]}
