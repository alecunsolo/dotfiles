local opt = vim.opt
-- Global configuration
-- ###############
-- # VIM OPTIONS #
-- ###############
-- Tab stuff
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
-- Show (relative)line numbers
opt.number = true
opt.relativenumber = true
-- Show cursor line
opt.cursorline = true
-- Search stuff
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
-- Preview substitutions live, as you type
opt.inccommand = "nosplit"
-- Keep signcolumn on by default
opt.signcolumn = "yes"
-- Column mark
opt.colorcolumn = "80"
-- Do not wrap
opt.wrap = false
-- Don't show the mode, since it's already in the status line
opt.showmode = false
-- Backup stuff
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
-- Mouse for all
opt.mouse = "a"
-- Show white spaces and stuff
opt.list = true
opt.listchars:append("eol:↴")
opt.listchars:append("extends:❯")
opt.listchars:append("precedes:❮")
opt.listchars:append("tab:▸ ")
opt.listchars:append("trail:⌴")
-- Sane new split behaviour
opt.splitbelow = true
opt.splitright = true
-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300
-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"
-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true
-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 5
-- Always use the block cursor
opt.guicursor = "a:block-Cursor"
-- Autowrite/read struff
opt.autowrite = true
opt.autoread = true
-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
