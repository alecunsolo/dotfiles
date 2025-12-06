-- Reload
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>",
  { desc = "Source current buffer", silent = true, buffer = true })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Source current line", silent = true, buffer = true })
vim.keymap.set("x", "<leader>x", ":lua<CR>", { desc = "Source current selection", silent = true, buffer = true })

vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
