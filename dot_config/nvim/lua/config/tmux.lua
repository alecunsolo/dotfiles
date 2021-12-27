require('config.map')

local status_ok, tmux = pcall(require, 'nvim-tmux-navigation')
if not status_ok then
  vim.notify('Failed to load "tmux"')
  return
end
tmux.setup({
  disable_when_zoomed = false,
})

map('n', '<C-h>', ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>", opts)
map('n', '<C-j>', ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>", opts)
map('n', '<C-k>', ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>", opts)
map('n', '<C-l>', ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>", opts)
--map('n', "<C-\\>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>", opts)
--map('n', "<C-Space>", ":lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>", opts)
