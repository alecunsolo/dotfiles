local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Self manage
  use({'https://github.com/wbthomason/packer.nvim'})
  -- Color scheme
  use({'https://github.com/EdenEast/nightfox.nvim', config = [[require('config.nightfox')]]})
  -- Lualine
  use({'https://github.com/nvim-lualine/lualine.nvim',
      requires = {'https://github.com/kyazdani42/nvim-web-devicons'},
      config = [[require('config.lualine')]]
  })

  -- Git
  use({'https://github.com/tpope/vim-fugitive'})
  use({'https://github.com/lewis6991/gitsigns.nvim',
    requires = {'https://github.com/nvim-lua/plenary.nvim'},
    config = [[require('config.gitsigns')]]
  })

  -- Tmux integration
  use({'https://github.com/alexghergh/nvim-tmux-navigation', config = [[require('config.tmux')]]})

  -- LSP
  use({'https://github.com/neovim/nvim-lspconfig',
    requires = {'williamboman/nvim-lsp-installer'},
    config = [[require('config.lsp')]]
  })

  -- Telescope
  use({ 'https://github.com/nvim-telescope/telescope.nvim',
    requires = {'https://github.com/nvim-lua/plenary.nvim'},
    config = [[require('config.telescope')]]
  })
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Tree sitter
  use({'https://github.com/nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('config.treesitter')]]
  })

  -- Autocompletion
  use({'hrsh7th/nvim-cmp',
    requires = { 'https://github.com/neovim/nvim-lspconfig',
      'https://github.com/hrsh7th/cmp-nvim-lsp',
      'https://github.com/hrsh7th/cmp-nvim-lua',
      'https://github.com/hrsh7th/cmp-buffer',
      'https://github.com/hrsh7th/cmp-path',
      'https://github.com/hrsh7th/cmp-cmdline',
      -- Snippets
      'https://github.com/L3MON4D3/LuaSnip',
      'https://github.com/rafamadriz/friendly-snippets',
      'https://github.com/saadparwaiz1/cmp_luasnip'
    },
    config = [[require('config.completion')]]
  })

  -- Editor config
  use({'https://github.com/editorconfig/editorconfig-vim'})

  if packer_bootstrap then
    require('packer').sync()
  end
end)
