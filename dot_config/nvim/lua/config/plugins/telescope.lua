return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.1.9",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-tree/nvim-web-devicons", opts = {} },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {},
        },
      })

      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
      vim.keymap.set("n", "<leader>fa", function()
        require("telescope.builtin").find_files({
          hidden = true,
          no_ignore = true,
        })
      end, { desc = "[F]ind [A]ll files" })
      vim.keymap.set("n", "<leader>fg", require("telescope.builtin").git_files, { desc = "[F]ind tracked [G]it files" })
      vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
      vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, { desc = "[F]ind [K]eymaps" })
      vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[F]ind open [B]uffer" })
      vim.keymap.set(
        "n",
        "<leader>f.",
        require("telescope.builtin").oldfiles,
        { desc = '[F]ind Recent Files ("." for repeat)' }
      )
      -- vim.keymap.set('n', '<leader>fr', require('telescope.builtin').live_grep, { desc = '[F]ind [R]ipgrep' })

      -- Find files in the neovim config
      vim.keymap.set("n", "<leader>en", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end, { desc = "[E]dit [N]eovim config" })
      -- Find neovim plugin files
      vim.keymap.set("n", "<leader>ep", function()
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        })
      end, { desc = "[E]dit neovim [P] plugins" })

      local ok, _ = pcall(require, "todo-comments")
      if ok then
        vim.keymap.set("n", "<leader>ft", [[:TodoTelescope<cr>]], { desc = "[F]ind [T]odo comments" })
      end

      require("config.telescope.globgrep").setup()
    end,
  },
}
