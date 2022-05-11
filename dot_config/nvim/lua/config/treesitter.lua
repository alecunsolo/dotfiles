local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  vim.notify('Failed to load "nvim-treesitter"')
  return
end

configs.setup({
  ensure_installed = 'all',
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})
