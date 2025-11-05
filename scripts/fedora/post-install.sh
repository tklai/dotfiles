#!/usr/bin/env bash

set -xe

sudo -v

install_packages ()
{
	sudo dnf install --skip-unavailable $@
}

CHASSIS=$(hostnamectl chassis)

mapfile -t copr_repos < <(grep -v '^#' "./packages/copr.repos" | grep -v '^$')
for repo in $copr_repos; do sudo dnf copr enable $repo; done

mapfile -t remove_packages < <(grep -v '^#' "./packages/remove.packages" | grep -v '^$')
if [ ${#remove_packages[@]} -ne 0 ]; then
	sudo dnf remove "${remove_packages[@]}"
fi

mapfile -t generic_packages < <(grep -v '^#' "./packages/generic.packages" | grep -v '^$')
if [ ${#generic_packages[@]} -ne 0 ]; then
	install_packages ${generic_packages[@]}
fi

if [ $CHASSIS == 'laptop' ]; then
	mapfile -t laptop_packages < <(grep -v '^#' "./packages/laptop.packages" | grep -v '^$')
	if [ ${#laptop_packages[@]} -ne 0 ]; then
		install_packages ${laptop_packages[@]}
	fi
fi

sudo dnf autoremove
