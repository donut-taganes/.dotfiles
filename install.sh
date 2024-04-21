#install nix
sh <(curl -L https://nixos.org/nix/install) --daemon
#source shell
. ~/.profile
#install nix pkgs
nix-env -iA nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.direnv

#stow
stow git
stow zsh
stow nvim
#make zsh available
command -v zsh | sudo tee -a /etc/shells
#set zsh as default
sudo chsh -s $(which zsh) $USER
#hop to zsh
exec zsh -l
#install them plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

