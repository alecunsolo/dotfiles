-- jj -> esc
for _, idx in ipairs({ "jj", "jk", "kj" }) do
  vim.keymap.set("i", idx, "<ESC>", { noremap = false, desc = "Exit INSERT mode" })
end
-- vsp shortcut
vim.keymap.set("n", "<leader>vv", [[:vnew<cr>]], { silent = true, desc = "Open new vertical split" })
-- Write file
-- vim.keymap.set("n", "<leader>ww", [[:w<cr>]], { desc = "[W]rite file" })
-- Close buffer
vim.keymap.set("n", "<leader>q", [[:close<cr>]], { desc = "Close buffer" })
-- Close other buffers
vim.keymap.set("n", "<leader>co", [[:only<cr>]], { desc = "[C]lose [O]ther buffers" })
-- Close all buffers but the current one
vim.keymap.set("n", "<leader>bo", [[: %bd | e# | bd# <CR>]], { desc = "[B]uffer [O]nly" })
-- No arrows
vim.keymap.set({ "n", "i" }, "<UP>", "<NOP>")
vim.keymap.set({ "n", "i" }, "<DOWN>", "<NOP>")
vim.keymap.set({ "n", "i" }, "<LEFT>", "<NOP>")
vim.keymap.set({ "n", "i" }, "<RIGHT>", "<NOP>")
-- Move selected lines
vim.keymap.set("x", "J", [[:m '>+1<CR>gv=gv]])
vim.keymap.set("x", "K", [[:m '<-2<CR>gv=gv]])
-- Disable ex mode
vim.keymap.set("n", "Q", "<NOP>")
-- Navigate between quickfix items
vim.keymap.set("n", "<leader>[", ":cprev<CR>", { desc = "Backward quickfix" })
vim.keymap.set("n", "<leader>]", ":cnext<CR>", { desc = "Forward quickfix" })
-- Disable command-line window
vim.keymap.set("n", "q:", "<NOP>")
vim.keymap.set("n", "q/", "<NOP>")
vim.keymap.set("n", "q?", "<NOP>")
-- Join lines without moving the cursor
vim.keymap.set("n", "J", "mzJ`z")
-- Remap for dealing with word wrap
vim.keymap.set("n", "k", [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })
vim.keymap.set("n", "j", [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
-- Center the cursor when jumping around
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "<leader>%", "%zz")
-- Next/previous search result
vim.keymap.set("n", "n", "nzzzv") -- zv: open folds
vim.keymap.set("n", "N", "Nzzzv")
-- Yank/Paste stuff
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]aste without overwriting the register" })
vim.keymap.set({ "n", "x" }, "<leader>y", [["+y]], { desc = "[y]ank to the system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to the system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>d", [["_d]], { desc = "[D]elete into the void" })
-- Change workspace
-- vim.keymap.set("n", "<leader>cw", "<cmd>silent !tmux neww txs<CR>", { desc = "[C]hange [W]orkspace" })
-- Toggle folding
vim.keymap.set("n", "+", "za", { desc = "Toggle folded region" })
