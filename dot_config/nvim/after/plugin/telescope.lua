local ok, ts = pcall(require, "telescope")
if not ok then
  return
end
local ok_b, builtin = pcall(require, "telescope.builtin")
if not ok_b then
  return
end
local ok_t, themes = pcall(require, "telescope.themes")
if not ok_t then
  return
end

ts.load_extension("fzf")
local kmap = vim.keymap.set
-- Telescope mappings
-- See `:help telescope.builtin`
kmap('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
kmap('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

kmap('n', '<leader>sg', builtin.git_files, { desc = '[S]earch [G]it files' })
kmap('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
kmap('n', '<leader>sb', builtin.buffers, { desc = '[S]earch existing buffers' })
kmap('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
kmap('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
kmap('n', '<leader>sr', builtin.live_grep, { desc = '[S]earch by [R]ipgrep' })
kmap('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
