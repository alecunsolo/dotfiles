return {
  {
    "stevearc/oil.nvim",
    -- Optional dependencies
    dependencies = { { "nvim-tree/nvim-web-devicons", opts = {} } },
    config = function()
      require("oil").setup({
        keymaps = {
          -- disable default keymaps
          ["~"] = false,
          ["`"] = false,
          ["<C-s>"] = false,
          ["<C-h>"] = false,
          ["<C-t>"] = false,
          ["<C-l>"] = false,
          -- custom stuff
          ["<C-R>"] = "actions.refresh",
          ["<C-v>"] = { "actions.select", opts = { vertical = true } },
          ["<C-x>"] = { "actions.select", opts = { horizontal = true } },
          ["<Esc>"] = { "actions.close", mode = "n" },
          ["q"] = { "actions.close", mode = "n" },
          ["<leader>yy"] = { "actions.yank_entry", opts = { modify = ":p:." }, mode = "n" },
          ["<leader>y"] = {
            "actions.yank_entry",
            opts = { modify = ":t" },
            mode = "n",
            desc = "Yank the filename of the entry under the cursor to a register",
          },
          ["gd"] = {
            desc = "Toggle file detail view",
            callback = function()
              Detail = not Detail
              if Detail then
                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
              else
                require("oil").set_columns({ "icon" })
              end
            end,
          },
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          max_width = 0.8,
          max_height = 0.8,
          border = "rounded",
        },
        confirmation = {
          border = "double",
        },
      })

      vim.keymap.set("n", "-", function()
        require("oil").open_float()
      end, { desc = "File explorer at the current directory" })
      vim.keymap.set("n", "_", function()
        require("oil").open_float(vim.fn.getcwd())
      end, { desc = "File explorer at the root directory" })
    end,
  },
}
