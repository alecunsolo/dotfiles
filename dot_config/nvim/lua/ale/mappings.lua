local kmap = vim.keymap.set

-- Write file
kmap('n', '<leader>wf', [[:w<cr>]], { desc = "[W]rite [F]ile" })
-- Close buffer
kmap('n', '<leader>cb', [[:close<cr>]], { desc = "[C]lose [B]uffer" })
-- Close other buffers
kmap('n', '<leader>co', [[:only<cr>]], { desc = "[C]lose [O]ther buffers" })
-- No arrows
kmap({ 'n', 'i' }, '<UP>', '<NOP>')
kmap({ 'n', 'i' }, '<DOWN>', '<NOP>')
kmap({ 'n', 'i' }, '<LEFT>', '<NOP>')
kmap({ 'n', 'i' }, '<RIGHT>', '<NOP>')
-- Move selected lines
kmap('v', 'J', [[:m '>+1<CR>gv=gv]])
kmap('v', 'K', [[:m '<-2<CR>gv=gv]])
-- Disable ex mode
kmap('n', 'Q', '<NOP>')
-- Navigate between quickfix items
kmap('n', '<leader>[', ':cprev<CR>', { desc = "Backward quickfix" })
kmap('n', '<leader>]', ':cnext<CR>', { desc = "Forward quickfix" })
-- Disable command-line window
kmap('n', 'q:', '<NOP>')
kmap('n', 'q/', '<NOP>')
kmap('n', 'q?', '<NOP>')
-- Join lines without moving the cursor
kmap('n', 'J', 'mzJ`z')
-- Remap for dealing with word wrap
kmap('n', 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })
kmap('n', 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
-- Center the cursor when jumping around
kmap('n', '<C-d>', '<C-d>zz')
kmap('n', '<C-u>', '<C-u>zz')
kmap('n', '<C-b>', '<C-b>zz')
kmap('n', '<C-f>', '<C-f>zz')
kmap('n', '{', '{zz')
kmap('n', '}', '}zz')
kmap('n', '<leader>%', '%zz')
-- Next/previous search result
kmap('n', 'n', 'nzzzv') -- zv: open folds
kmap('n', 'N', 'Nzzzv')
-- Yank/Paste stuff
kmap('x', '<leader>p', [["_dP]], { desc = '[P]aste without overwriting the register' })
kmap({ 'n', 'v' }, '<leader>y', [["+y]], { desc = '[y]ank to the system clipboard' })
kmap('n', '<leader>Y', [["+Y]], { desc = '[Y]ank to the system clipboard' })
kmap({ 'n', 'v' }, '<leader>d', [["_d]], { desc = '[D]elete into the void' })
-- Deal with comments
kmap('n', '<leader>o', 'o<C-U>')
kmap('n', '<leader>O', 'O<C-U>')
-- Change workspace
kmap('n', '<leader>cw', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { desc = '[C]hange [W]orkspace' })
-- Close all buffers but the current one
kmap('n', '<leader>bo', [[: %bd | e# | bd# <CR>]], { desc = '[B]uffer [O]nly' })
