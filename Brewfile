# Taps
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
brew "eza"
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
brew "golang"
brew "gomplate"
brew "htop"
brew "imagemagick"
brew "jq"
brew "just"
brew "lazygit"
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
brew "tree-sitter-cli"
brew "watch"
brew "ykman"
brew "yq"
brew "zoxide"
brew "zsh"

# Borg with fuse support
brew "borgbackup/tap/borgbackup-fuse"

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
cask "amethyst"
cask "firefox"
cask "font-fira-code-nerd-font"
cask "google-chrome"
cask "karabiner-elements"
cask "libreoffice"
cask "logi-options+"
cask "macfuse"
cask "obsidian"
#cask "pgadmin4"
cask "rar"
cask "tigervnc-viewer"
cask "vlc"
cask "vorta"
cask "wezterm"
cask "wireshark-app"
cask "yubico-yubikey-manager"
#cask "zsa-wally"

# Mac Applications
mas "Tailscale", id: 1475387142
mas "WireGuard", id: 1451685025
mas "Yubico Authenticator", id: 1497506650
mas "ZSA Keymapp", id: 6472865291

# Other Brewfiles
customFiles = [
    "Brewfile.personal",
    "Brewfile.work"
]

customFiles.each do |customFile|
  if File.exist?(customFile)
    instance_eval(File.read(customFile))
  end
end
