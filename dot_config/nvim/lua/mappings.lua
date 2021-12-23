require('config.map')

vim.g.mapleader = ' '

-- Esc
map('i', 'jk', '<ESC>', opts)

-- No arrows
map('n', '<UP>', '<NOP>', opts)
map('n', '<DOWN>', '<NOP>', opts)
map('n', '<LEFT>', '<NOP>', opts)
map('n', '<RIGHT>', '<NOP>', opts)
map('i', '<UP>', '<NOP>', opts)
map('i', '<DOWN>', '<NOP>', opts)
map('i', '<LEFT>', '<NOP>', opts)
map('i', '<RIGHT>', '<NOP>', opts)

-- File management
map('n', 's', ':w<CR>', opts)
map('n', '<leader>s', ':noa w<CR>', opts)
-- Allow gf to open non-existent files
map('n', 'gf', ':edit <cfile><CR>', opts)

-- Windows
map('n', '<leader>c', ':close<CR>', opts)
map('n', '<leader>o', ':only<CR>', opts)

-- MISC
map('n', '<leader><SPACE>', ':noh<CR>', opts)
map('n', '<leader>a', 'ggVG', opts) -- Select all
-- Open file in the same directory of the currently open one
-- http://vimcasts.org/episodes/the-edit-command/
local current_dir = [[<C-R>=fnameescape(expand('%:h')).'/'<cr>]]
map('c', '%%', current_dir, opts)
map('n', '<leader>ew', ':e '..current_dir, opts)
map('n', '<leader>es', ':sp '..current_dir, opts)
map('n', '<leader>ev', ':vsp '..current_dir, opts)
map('n', '<leader>ej', ':tabe '..current_dir, opts)

-- Reselect lines when indenting
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

-- Plugin stuff
-- Packer
map('n', '<leader>ps', ':PackerSync<CR>', opts)
map('n', '<leader>pS', ':PackerStatus<CR>', opts)
