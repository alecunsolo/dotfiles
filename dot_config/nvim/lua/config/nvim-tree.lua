-- vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  vim.notify('Failed to load plugin "nvim-tree"')
  return
end

require('config.map')

map('n', '<Leader>e', '<cmd>NvimTreeFindFileToggle<cr>', opts)

nvim_tree.setup({
  renderer = {
    highlight_git = true,
    add_trailing = true,
    highlight_opened_files = "icon",
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = '',
          staged = 'S',
          unmerged = '',
          renamed = '➜',
          deleted = '',
          untracked = 'U',
          ignored = '◌',
        },
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
        },
      }
    }
  }
})
