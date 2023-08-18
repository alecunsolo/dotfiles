# Taps
tap "homebrew/cask-fonts"
tap "homebrew/services"
# Other taps
tap "borgbackup/tap"
tap "fluxcd/tap"

# Formulae
brew "bat"
brew "bzip2"
brew "chezmoi"
brew "coreutils"
brew "curl"
brew "direnv"
brew "fd"
brew "figlet"
brew "fluxcd/tap/flux"
brew "fzf"
brew "gh"
brew "git"
brew "git-filter-repo"
brew "gnu-sed"
brew "gnu-tar"
brew "gnupg"
brew "jq"
brew "make"
brew "mas"
brew "neovim"
brew "nmap"
brew "node"
brew "nss"
brew "openssh"
brew "pinentry-mac"
brew "podman"
brew "proxychains-ng"
brew "qrencode"
brew "ripgrep"
brew "sops"
brew "step"
brew "stylua"
brew "syncthing"
brew "telnet"
brew "tmux"
brew "tree"
brew "yq"
brew "zsh"

# Borg with fuse support
brew "borgbackup-fuse"
brew "libb2"
brew "xxhash"

# Pyenv prerequisites
brew "openssl"
brew "readline"
brew "sqlite3"
brew "xz"
brew "zlib"
# Pyenv
brew "pyenv"
brew "pyenv-virtualenv"

# Casks
cask "1password"
cask "1password-cli"
cask "balenaetcher"
cask "deepnest"
cask "firefox"
cask "font-fira-code-nerd-font"
cask "gimp"
cask "gnucash"
cask "google-chrome"
cask "inkscape"
cask "iterm2"
cask "libreoffice"
cask "macfuse"
cask "obsidian"
cask "pgadmin4"
cask "rar"
cask "raspberry-pi-imager"
cask "rectangle"
cask "spotify"
cask "vlc"
cask "vorta"
cask "wireshark"
cask "zsa-wally"

# Mac Applications
mas "WireGuard", id: 1451685025
mas "Yubico Authenticator", id: 1497506650
mas "Tailscale", id: 1475387142

# Other Brewfiles
customFiles = [
    "Work/Brewfile"
]

customFiles.each do |customFile|
  if File.exists?(customFile)
    instance_eval(File.read(customFile))
  end
end
