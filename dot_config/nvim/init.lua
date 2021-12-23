require('options')
require('mappings')
require('plugins')

-- This may fail on bootstrap
local configurations = {
  'completion',
  'gitsigns',
  'lsp',
  'lualine',
  'nightfox',
  'telescope',
  'tmux',
  'treesitter',
}

for _, plugin in ipairs(configurations) do
  local status_ok, _ = pcall(require, 'config.'..plugin)
  if not status_ok then
    vim.notify('Failed to configure plugin '..plugin)
  end
end

