return {
  {
    "folke/zen-mode.nvim",
    keys = {
      {
        "<leader>zz",
        function()
          require("zen-mode").toggle()
        end,
        desc = "Toggle Zen mode",
      },
    },
    opts = {},
  },
  {
    "folke/twilight.nvim",
    opts = {},
  },
}
