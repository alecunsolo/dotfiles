local O = vim.opt
-- Global configuration
-- ###############
-- # VIM OPTIONS #
-- ###############
-- Tab stuff
O.expandtab = true
O.shiftwidth = 4
O.softtabstop = 4
O.tabstop = 4
-- Show (relative)line numbers
O.number = true
O.relativenumber = true
-- Show cursor line
O.cursorline = true
-- Search stuff
O.ignorecase = true
O.smartcase = true
O.hlsearch = false
-- Preview substitutions live, as you type
O.inccommand = 'nosplit'
-- Keep signcolumn on by default
O.signcolumn = 'yes'
-- Column mark
O.colorcolumn = '80'
-- Do not wrap
O.wrap = false
-- Don't show the mode, since it's already in the status line
O.showmode = false
-- Backup stuff
O.swapfile = false
O.backup = false
O.undodir = os.getenv("HOME") .. "/.vim/undodir"
O.undofile = true
-- Mouse for all
O.mouse = 'a'
-- Show white spaces and stuff
O.list = true
O.listchars:append 'eol:↴'
O.listchars:append 'extends:❯'
O.listchars:append 'precedes:❮'
O.listchars:append 'tab:▸ '
O.listchars:append 'trail:⌴'
-- Sane new split behaviour
O.splitbelow = true
O.splitright = true
-- Decrease update time
O.updatetime = 250
O.timeoutlen = 300
-- Set completeopt to have a better completion experience
O.completeopt = 'menuone,noselect'
-- NOTE: You should make sure your terminal supports this
O.termguicolors = true
-- Minimal number of screen lines to keep above and below the cursor.
O.scrolloff = 5
-- Always use the block cursor
O.guicursor = "a:block-Cursor"
-- Autowrite/read struff
O.autowrite = true
O.autoread = true
