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
  use({
      'https://github.com/nvim-lualine/lualine.nvim',
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
  use({'https://github.com/neovim/nvim-lspconfig', config = [[require('config.lsp')]]})

  -- Telescope
  use({ 'https://github.com/nvim-telescope/telescope.nvim',
    requires = {'https://github.com/nvim-lua/plenary.nvim'},
    config = [[require('config.telescope')]]
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
