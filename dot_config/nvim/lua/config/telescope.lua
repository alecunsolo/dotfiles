require('config.map')

map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope git_files<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
