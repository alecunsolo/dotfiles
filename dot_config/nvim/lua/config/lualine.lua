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
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        symbols = {
          modified = '[+]', -- when the file was modified
          readonly = '[]', -- if the file is not modifiable or readonly
          unnamed = '[No Name]', -- default display name for unnamed buffers
        },
      },
    },
  },
})
