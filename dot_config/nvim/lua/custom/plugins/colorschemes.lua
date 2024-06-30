return {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      transparent = true,
      dim_inactive = true,
      -- Brighter line numbers
      on_highlights = function(hl, _)
        hl.LineNr = {
          fg = "#737aa2",
        }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
