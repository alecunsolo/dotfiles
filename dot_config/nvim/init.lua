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

require "custom.init.options"
require "custom.init.keymappings"
require "custom.init.random"
require "custom.init.lazy"
-- Plugin configurations
require "custom.config.autocompletion"
require "custom.config.lsp"
