-- Global configuration
-- ###############
-- # VIM OPTIONS #
-- ###############
-- Tab stuff
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
-- Show (relative)line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Show cursor line
vim.opt.cursorline = true
-- Search stuff
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
-- Preview substitutions live, as you type
vim.opt.inccommand = "nosplit"
-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
-- Column mark
vim.opt.colorcolumn = "80"
-- Do not wrap
vim.opt.wrap = false
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Backup stuff
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- Mouse for all
vim.opt.mouse = "a"
-- Show white spaces and stuff
vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("extends:❯")
vim.opt.listchars:append("precedes:❮")
-- vim.opt.listchars:append("tab:▸ ")
vim.opt.listchars:append("tab:» ")
-- vim.opt.listchars:append("trail:⌴")
vim.opt.listchars:append("trail:·")
vim.opt.listchars:append("nbsp:⌴")
-- Sane new split behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.opt.completeopt = "menuone,noselect"
-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5
-- Always use the block cursor
vim.opt.guicursor = "a:block-Cursor"
-- Autowrite/read struff
vim.opt.autowrite = true
vim.opt.autoread = true
-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldenable = false
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
-- -- Default border
vim.opt.winborder = "rounded"
-- Matchpairs
vim.opt.matchpairs:append("<:>")
-- NOTE: Might be overwritten by filetypes
-- Do not add comments when using `o` or `O`
vim.opt.formatoptions:remove("o")
