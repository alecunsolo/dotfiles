return {
  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",
  -- See `:help lualine.txt`
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "tokyonight",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
  },
}
