require('config.map')
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
      },
    },
  },
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
})

require('telescope').load_extension('fzf')

local M = {}
M.hidden_files = function()
  local opts = { find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git', '--strip-cwd-prefix' } }
  require('telescope.builtin').find_files(opts)
end

map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope git_files<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':lua require("config.telescope").hidden_files()<CR>', opts)

return M
