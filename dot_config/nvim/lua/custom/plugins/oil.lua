return {
  "stevearc/oil.nvim",
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    keymaps = {
      -- Disable keymaps
      ["<C-c>"] = false,
      ["<C-l>"] = false,
      ["<C-s>"] = false,
      ["<C-t>"] = false,
      -- Custom keymaps
      ["q"] = "actions.close",
      ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
      ["<C-R>"] = "actions.refresh",
      ["<leader>y"] = { "actions.yank_entry", desc = "Yank entry" },
    },
  },
  keys = {
    {
      "<leader>-",
      function()
        require("oil").open_float()
      end,
      desc = "File explorer at current directory",
    },
    {
      "<leader>_",
      function()
        require("oil").open_float(vim.fn.getcwd())
      end,
      desc = "File explorer at root directory",
    },
  },
}
