local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Wrap 'require' in a protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify('Failed to load "packer"')
  return
end

return packer.startup(function(use)
  -- Self manage
  use 'https://github.com/wbthomason/packer.nvim'
  -- Color scheme
  use 'https://github.com/EdenEast/nightfox.nvim'
  -- Lualine
  use 'https://github.com/nvim-lualine/lualine.nvim'
  use 'https://github.com/kyazdani42/nvim-web-devicons'

  -- Git
  use 'https://github.com/tpope/vim-fugitive'
  use 'https://github.com/lewis6991/gitsigns.nvim'
  use 'https://github.com/nvim-lua/plenary.nvim'

  -- Tmux integration
  use 'https://github.com/alexghergh/nvim-tmux-navigation'

  -- LSP
  use 'https://github.com/neovim/nvim-lspconfig'
  use 'https://github.com/williamboman/nvim-lsp-installer'

  -- Telescope
  use 'https://github.com/nvim-telescope/telescope.nvim'
  use 'https://github.com/nvim-lua/plenary.nvim'
  use {'https://github.com/nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Tree sitter
  use {'https://github.com/nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Autocompletion
  use 'https://github.com/hrsh7th/nvim-cmp'
  use 'https://github.com/neovim/nvim-lspconfig'
  use 'https://github.com/hrsh7th/cmp-nvim-lsp'
  use 'https://github.com/hrsh7th/cmp-nvim-lua'
  use 'https://github.com/hrsh7th/cmp-buffer'
  use 'https://github.com/hrsh7th/cmp-path'
  use 'https://github.com/hrsh7th/cmp-cmdline'
  -- Snippets
  use 'https://github.com/L3MON4D3/LuaSnip'
  use 'https://github.com/rafamadriz/friendly-snippets'
  use 'https://github.com/saadparwaiz1/cmp_luasnip'

  -- Editor config
  use 'https://github.com/editorconfig/editorconfig-vim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

