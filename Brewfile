# Taps
tap "homebrew/cask"
tap "homebrew/cask-fonts"
tap "homebrew/services"
# Other taps
tap "goreleaser/tap"
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
brew "git"
brew "git-crypt"
brew "git-filter-repo"
brew "gnu-sed"
brew "gnu-tar"
brew "gnupg"
brew "go"
brew "goreleaser"
brew "jq"
brew "make"
brew "mas"
brew "neovim"
brew "nmap"
brew "node"
brew "openssh"
brew "pinentry-mac"
brew "proxychains-ng"
brew "qrencode"
brew "rar"
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

# Pyenv prerequisites
brew "openssl"
brew "readline"
brew "sqlite3"
brew "xz"
brew "zlib"
# Pyenv
brew "pyenv"

# Casks
cask "1password"
cask "1password-cli"
cask "balenaetcher"
cask "deepnest"
cask "discord"
cask "docker"
cask "firefox"
cask "font-fira-code-nerd-font"
cask "gimp"
cask "gnucash"
cask "google-chrome"
cask "inkscape"
cask "iterm2"
cask "libreoffice"
cask "rectangle"
cask "spotify"
cask "vlc"
cask "wireshark"

# Mac Applications
mas "WireGuard", id: 1451685025
mas "Yubico Authenticator", id: 1497506650

# Other Brewfiles
customFiles = [
    "Work/Brewfile"
]

customFiles.each do |customFile|
  if File.exists?(customFile)
    instance_eval(File.read(customFile))
  end
end
