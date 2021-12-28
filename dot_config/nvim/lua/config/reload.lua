require('config.map')
local custom_namespace = 'config'
function _G.ReloadConfig()
  local status_ok, reload = pcall(require, 'plenary.reload')
  if not status_ok then
    vim.notify('Failed to load "plenary.reload"')
    return
  end
  reload.reload_module(custom_namespace)

  dofile(vim.env.MYVIMRC)
end

map('n', '<Leader>vs', '<Cmd>lua ReloadConfig()<CR>', opts)
vim.cmd('command! ReloadConfig lua ReloadConfig()')
