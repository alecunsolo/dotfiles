return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,
    dim_inactive = true,
    -- Brighter line numbers
    on_highlights = function(hl, c)
      hl.LineNr = {
        fg = "#737aa2"
      }
    end
  },
}
