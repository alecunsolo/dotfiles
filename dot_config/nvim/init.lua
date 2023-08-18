-- A lot of this stuff is copy/pasted from:
--  - https://github.com/nvim-lua/kickstart.nvim
--  - https://github.com/ThePrimeagen/init.lua

-- ###################
-- # GLOBAL SETTINGS #
-- ###################
-- Set <space> as the leader key
-- NB Do this as early as possible
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ###############
-- # VIM OPTIONS #
-- ###############
-- Tab stuff
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
-- Show (relative)line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Show cursor line
vim.opt.cursorline = true
-- Search stuff
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- Column mark
vim.opt.colorcolumn = '80'
-- Do not wrap
vim.opt.wrap = false
-- Backup stuff
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- Mouse for all
vim.opt.mouse = 'a'
-- Show white spaces and stuff
vim.opt.list = true
vim.opt.listchars:append 'eol:↴'
vim.opt.listchars:append 'extends:❯'
vim.opt.listchars:append 'precedes:❮'
vim.opt.listchars:append 'tab:▸ '
vim.opt.listchars:append 'trail:⌴'
-- Sane new split behaviour
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'
-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- #######################
-- # PLUGIN INSTALLATION #
-- #######################
-- Install package manager
-- https://github.com/folke/lazy.nvim
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- NOTE: Here is where you install your plugins.
-- You can configure plugins using the `config` key.
--
-- You can also configure plugins after the setup call,
-- as they will be available in your neovim runtime.
require('lazy').setup({
  -- UI
  -- Add color scheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
  -- Status line
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'tokyonight',
      },
    },
  },

  -- Comment plugin
  { 'numToStr/Comment.nvim', opts = {} },

  -- Indentation guides
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      show_end_of_line = true,
      show_current_context = true,
    },
  },

  -- Git stuff
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },

  -- Treesitter
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- Plugin that shows the context of the currently visible buffer contents.
  { 'nvim-treesitter/nvim-treesitter-context', opts = {} },

  -- Tmux integration
  {
    'christoomey/vim-tmux-navigator',
    init = function()
      -- Save on switch
      vim.g.tmux_navigator_save_on_switch = 1
      -- Disable when zoomed
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --     refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim',       opts = {} },
    },
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      -- 'rafamadriz/friendly-snippets',
    },
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {}
  },

  -- Autopairs
  {
    'echasnovski/mini.pairs',
    version = '*',
    opts = {},
  },

  -- Coloured delimiters
  'HiPhish/rainbow-delimiters.nvim',

  -- Surround
  {
    'echasnovski/mini.surround',
    version = '*',
    opts = {},
  },

  -- Zen-mode
  { "folke/zen-mode.nvim", opts = {} },

  -- Twilight
  { "folke/twilight.nvim", opts = {} },

  -- Fast file selector
  { "ThePrimeagen/harpoon", opts = {} }
}, {})

-- ########################
-- # PLUGIN CONFIGURATION #
-- ########################
-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },

  -- Make the linter happy
  modules = {},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
}

-- [[ Configure Telescope ]]
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require("luasnip.loaders.from_lua").lazy_load()
luasnip.config.setup({
  history = false,
  update_events = {"TextChanged", "TextChangedI"},
  region_check_events = "CursorMoved, InsertLeave",
})

---@diagnostic disable-next-line: missing-fields
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<C-y>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

-- [[ Configure rainbow-delimiters ]]
local rainbow_delimiters = require 'rainbow-delimiters'
vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow_delimiters.strategy['global'],
    vim = rainbow_delimiters.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
  },
  highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
  },
}

--[[ Configure comments ]]
local comment_ft = require("Comment.ft")
comment_ft.set('hcl', '#%s')

-- ################
-- # KEY BINDINGS #
-- ################
-- No arrows
vim.keymap.set({'n', 'i'}, '<UP>', '<NOP>')
vim.keymap.set({'n', 'i'}, '<DOWN>', '<NOP>')
vim.keymap.set({'n', 'i'}, '<LEFT>', '<NOP>')
vim.keymap.set({'n', 'i'}, '<RIGHT>', '<NOP>')
-- Move selected lines
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]])
-- Disable ex mode
vim.keymap.set('n', 'Q', '<NOP>')
-- Disable command-line window
vim.keymap.set('n', 'q:', '<NOP>')
vim.keymap.set('n', 'q/', '<NOP>')
vim.keymap.set('n', 'q?', '<NOP>')
-- Join lines without moving the cursor
vim.keymap.set('n', 'J', 'mzJ`z')
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })
vim.keymap.set('n', 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })
-- Center the cursor when jumping around
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-b>', '<C-b>zz')
vim.keymap.set('n', '<C-f>', '<C-f>zz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', '<leader>%', '%zz')
-- Next/previous search result
vim.keymap.set('n', 'n', 'nzzzv') -- zv: open folds
vim.keymap.set('n', 'N', 'Nzzzv')
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>tt', ':TroubleToggle<cr>', { desc = '[T]rouble [t]oggle' })
-- Telescope mappings
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch [G]it files' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch existing buffers' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').live_grep, { desc = '[S]earch by [R]ipgrep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
-- Yank/Paste stuff
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = '[P]aste without overwriting the register' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = '[y]ank to the system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = '[Y]ank to the system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = '[D]elete into the void' })
-- Git
vim.keymap.set('n', '<leader>gg', ':Git<cr>', { desc = 'Open Fugitive window' })
-- Go to the beginning of the context (treesitter)
vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, { silent = true })
-- File explorer
vim.keymap.set('n', '<leader>ee', vim.cmd.NvimTreeToggle, { desc = '[O]pen file [E]xplorer' })
vim.keymap.set('n', '<leader>ef', vim.cmd.NvimTreeFindFileToggle,
  { desc = '[O]pen file explorer and go to current [F]ile' })
-- Deal with comments
vim.keymap.set('n', '<leader>o', 'o<C-U>')
vim.keymap.set('n', '<leader>O', 'O<C-U>')
-- Zen mode
vim.keymap.set('n', '<leader>zm', vim.cmd.ZenMode)
-- Change workspace
vim.keymap.set('n', '<leader>cw', '<cmd>silent !tmux neww tmux-sessionizer<CR>', { desc = '[C]hange [W]orkspace'} )
-- Harpoon mappings
vim.keymap.set('n', '<leader>ha', require("harpoon.mark").add_file, { desc = '[H]arpoon - [A]dd mark'})
vim.keymap.set('n', '<leader>ht', require("harpoon.ui").toggle_quick_menu, { desc = '[H]arpoon - [T]oggle UI'})
vim.keymap.set('n', '<leader>h1', function() require("harpoon.ui").nav_file(1) end, { desc = '[H]arpoon - [1] file'} )
vim.keymap.set('n', '<leader>h2', function() require("harpoon.ui").nav_file(2) end, { desc = '[H]arpoon - [2] file'} )
vim.keymap.set('n', '<leader>h3', function() require("harpoon.ui").nav_file(3) end, { desc = '[H]arpoon - [3] file'} )
vim.keymap.set('n', '<leader>h4', function() require("harpoon.ui").nav_file(4) end, { desc = '[H]arpoon - [4] file'} )
-- Lua snippets
vim.keymap.set({'i'}, '<C-K>', function() require("luasnip").expand() end, {silent = true})
vim.keymap.set({'i', 's'}, '<C-L>', function() require("luasnip").jump( 1) end, {silent = true})
vim.keymap.set({'i', 's'}, '<C-J>', function() require("luasnip").jump(-1) end, {silent = true})

vim.keymap.set({'i', 's'}, '<C-E>', function()
	if require("luasnip").choice_active() then
		require("luasnip").change_choice(1)
	end
end, {silent = true})

-- ####################
-- # CUSTOM FILETYPES #
-- ####################
require("os")
vim.filetype.add({
  filename = {
    [os.getenv('HOME') .. '/.kube/config'] = 'yaml', -- Only for this exact path
  },
  pattern = {
    ['Jenkinsfile.*'] = 'groovy',
    ['.*/.ssh/config.d/.*'] = 'sshconfig',
  }
})

-- vim: ts=2 sts=2 sw=2 et
