local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  vim.notify('Failed to load "lualine"')
  return
end

lualine.setup({
  options = {
    -- ... your lualine config
    theme = 'nightfox',
  },
})
