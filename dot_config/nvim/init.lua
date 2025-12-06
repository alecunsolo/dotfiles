-- ###################
-- # GLOBAL SETTINGS #
-- ###################
-- Set <space> as the leader key
-- NB Do this as early as possible
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.mappings")
require("config.lazy")
require("config.autocommands")
require("config.filetypes")
