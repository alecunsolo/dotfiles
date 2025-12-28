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
-- move the mark at the start of the selection ('<) down (+1), select again the
-- area (gv), format the selection (=), and reselect the area (gv again)
vim.keymap.set("x", "J", [[:m '>+1<CR>gv=gv]])
-- move the mark at the end of the selection ('>) up (-2), select again the area
-- (gv), format the selection (=), and reselect the area (gv again)
vim.keymap.set("x", "K", [[:m '<-2<CR>gv=gv]])
-- `gf` even if the file does not exists
vim.keymap.set(
  "n",
  "gf",
  [[:e <cfile><CR>]],
  { silent = true, noremap = true, desc = "[G]o to [F]ile (create if not exists)" }
)
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

-- Toggle line wrapping for the current window only
local toggle_wrap = function()
  if vim.wo.wrap then
    vim.wo.wrap = false
  else
    vim.wo.wrap = true
  end
end
vim.keymap.set("n", "<Leader>w", toggle_wrap, { desc = "Toggle line wrap", noremap = true, silent = true })
