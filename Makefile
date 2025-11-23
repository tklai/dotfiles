.PHONY: postinstall-fedora
postinstall-fedora:
	./scripts/fedora/post-install.sh

.PHONY: postinstall-arch
postinstall-arch:
	./scripts/arch/postinstall.sh

.PHONY: arch-docker
arch-docker:
	./scripts/arch/docker.sh

.PHONY: arch-vm
arch-vm:
	./scripts/arch/libvirt.sh

.PHONY: stow-base
stow-base:
	stow zsh
	stow nvim
	stow tmux
	stow git
	stow lazygit
	stow wezterm

.PHONY: stow-tiling-base
stow-tiling-base:
	stow kanshi
	stow fuzzel
	stow dunst
	stow waybar

.PHONY: stow-hypr
stow-hypr:
	stow hypr

.PHONY: stow-niri
stow-niri:
	make stow-hypr
	stow niri
