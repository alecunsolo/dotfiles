return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      desc = "Next todo comment",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      desc = "Previous todo comment",
    },
    { "<leader>tq", [[:TodoQuickFix<CR>]], desc = "[T]odo - [Q]uickfix" },
    { "<leader>tt", [[:TodoTelescope<CR>]], desc = "[T]odo - [T]elescope" },
  },
  opts = {},
}
