-- A lot of this stuff is copy/pasted from:
--  - https://github.com/nvim-lua/kickstart.nvim
--  - https://github.com/ThePrimeagen/init.lua

-- ###################
-- # GLOBAL SETTINGS #
-- ###################
-- Set <space> as the leader key
-- NB Do this as early as possible
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Configure global that should be always available (not plugin ones)
require("ale.globals")

-- Configure standard keymappings (do not require any plugin)
require("ale.mappings")

-- Bootstrap the plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure the plugin manager. I splitted the plugin spec in multiple files.
-- See: https://github.com/folke/lazy.nvim#-structuring-your-plugins
require("lazy").setup("custom.plugins")

-- Color scheme
vim.cmd [[colorscheme tokyonight]]
