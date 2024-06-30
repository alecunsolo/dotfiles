local kmap = vim.keymap.set

-- jj -> esc
for _, idx in ipairs({ "jj", "jk", "kj" }) do
  kmap("i", idx, "<ESC>", { noremap = false, desc = "Exit INSERT mode" })
end
-- vsp shortcut
kmap("n", "<leader>vv", [[:vsp<cr>]], { silent = true, desc = "Open new vertical split" })
-- Write file
kmap("n", "<leader>w", [[:w<cr>]], { desc = "[W]rite file" })
-- Close buffer
kmap("n", "<leader>q", [[:close<cr>]], { desc = "Close buffer" })
-- Close other buffers
kmap("n", "<leader>co", [[:only<cr>]], { desc = "[C]lose [O]ther buffers" })
-- Close all buffers but the current one
kmap("n", "<leader>bo", [[: %bd | e# | bd# <CR>]], { desc = "[B]uffer [O]nly" })
-- No arrows
kmap({ "n", "i" }, "<UP>", "<NOP>")
kmap({ "n", "i" }, "<DOWN>", "<NOP>")
kmap({ "n", "i" }, "<LEFT>", "<NOP>")
kmap({ "n", "i" }, "<RIGHT>", "<NOP>")
-- Move selected lines
kmap("v", "J", [[:m '>+1<CR>gv=gv]])
kmap("v", "K", [[:m '<-2<CR>gv=gv]])
-- Disable ex mode
kmap("n", "Q", "<NOP>")
-- Navigate between quickfix items
kmap("n", "<leader>[", ":cprev<CR>", { desc = "Backward quickfix" })
kmap("n", "<leader>]", ":cnext<CR>", { desc = "Forward quickfix" })
-- Disable command-line window
kmap("n", "q:", "<NOP>")
kmap("n", "q/", "<NOP>")
kmap("n", "q?", "<NOP>")
-- Join lines without moving the cursor
kmap("n", "J", "mzJ`z")
-- Remap for dealing with word wrap
kmap("n", "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })
kmap("n", "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
-- Center the cursor when jumping around
kmap("n", "<C-d>", "<C-d>zz")
kmap("n", "<C-u>", "<C-u>zz")
kmap("n", "<C-b>", "<C-b>zz")
kmap("n", "<C-f>", "<C-f>zz")
kmap("n", "{", "{zz")
kmap("n", "}", "}zz")
kmap("n", "<leader>%", "%zz")
-- Next/previous search result
kmap("n", "n", "nzzzv") -- zv: open folds
kmap("n", "N", "Nzzzv")
-- Yank/Paste stuff
kmap("x", "<leader>p", [["_dP]], { desc = "[P]aste without overwriting the register" })
kmap({ "n", "v" }, "<leader>y", [["+y]], { desc = "[y]ank to the system clipboard" })
kmap("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to the system clipboard" })
kmap({ "n", "v" }, "<leader>d", [["_d]], { desc = "[D]elete into the void" })
-- Change workspace
-- kmap("n", "<leader>cw", "<cmd>silent !tmux neww txs<CR>", { desc = "[C]hange [W]orkspace" })
-- Toggle folding
kmap("n", "+", "za", { desc = "Toggle folded region" })
