-- A lot of this stuff is copy/pasted from:
--  - https://github.com/nvim-lua/kickstart.nvim
--  - https://github.com/ThePrimeagen/init.lua

-- ###################
-- # GLOBAL SETTINGS #
-- ###################
-- Set <space> as the leader key
-- NB Do this as early as possible
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Configure global that should be always available (not plugin ones)
require("ale.globals")

-- Configure standard keymappings (do not require any plugin)
require("ale.mappings")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end,
})

-- Bootstrap the plugin manager
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Configure the plugin manager. I splitted the plugin spec in multiple files.
-- See: https://github.com/folke/lazy.nvim#-structuring-your-plugins
require("lazy").setup("custom.plugins")

-- Color scheme
vim.cmd([[colorscheme tokyonight]])

-- vim: ts=2 sts=2 sw=2 et
