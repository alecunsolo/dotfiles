return {
  -- Alabaster
  {
    "p00f/alabaster.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- When true, comments are dimmed instead of being highlighteed bright yellow.
      vim.g.alabaster_dim_comments = true
      -- When true, floating window borders have a foreground colour and background
      -- colour is the same as Normal. When false, floating window borders have
      -- no foreground colour and background colour is the same as popup menus.
      vim.g.alabaster_floatborder = true
      vim.cmd("colorscheme alabaster")
    end,
  },

  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
          return {}
        end,
        theme = "wave", -- Load "wave" theme
        background = { -- map the value of 'background' option to a theme
          dark = "dragon", -- try "dragon" !
          light = "lotus",
        },
      })
      -- setup must be called before loading
      vim.cmd("colorscheme kanagawa")
    end,
  },

  -- Kanso
  {
    "webhooked/kanso.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- Default options:
      require("kanso").setup({
        bold = true, -- enable bold fonts
        italics = true, -- enable italics
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        -- functionStyle = { bold = true},
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        background = { -- map the value of 'background' option to a theme
          dark = "zen", -- try "zen", "mist" or "pearl" !
          light = "pearl", -- try "zen", "mist" or "pearl" !
        },
      })
      -- setup must be called before loading
      vim.cmd("colorscheme kanso")
    end,
  },

  -- No Clown Fiesta
  {
    "aktersnurra/no-clown-fiesta.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("no-clown-fiesta").setup({
        theme = "dark", -- supported themes are: dark, dim, light
        transparent = false, -- Enable this to disable the bg color
        styles = {
          -- You can set any of the style values specified for `:h nvim_set_hl`
          comments = { italic = true },
          functions = {},
          keywords = { bold = true },
          lsp = {},
          match_paren = {},
          type = {},
          variables = {},
        },
      })
      vim.cmd([[colorscheme no-clown-fiesta]])
    end,
  },

  -- Oxocarbon
  {
    "nyoom-engineering/oxocarbon.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark" -- set this to dark or light
      vim.cmd("colorscheme oxocarbon")
    end,
  },

  -- Rosè pine
  {
    "rose-pine/neovim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        dim_inactive_windows = true,
        extend_background_behind_borders = true,
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },

  -- Tokyo Night
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line:missing-fields
      require("tokyonight").setup({
        -- style = "storm",
        style = "storm",
        styles = {
          keywords = { italic = false },
        },
        transparent = true,
        dim_inactive = true,
        -- This works, but mess with lualine
        -- on_colors = function(colors)
        --   colors.fg_gutter = "#707cb2"
        -- end,
        on_highlights = function(hl, _)
          local brightGray = {
            fg = "#707cb2",
          }
          hl.Comment = brightGray
          hl.LineNrAbove = brightGray
          hl.LineNrBelow = brightGray
        end,
      })
      vim.cmd([[colorscheme tokyonight]])
      vim.cmd([[highlight diffAdded guibg=none]])
      vim.cmd([[highlight diffRemoved guibg=none]])
    end,
  },
}
