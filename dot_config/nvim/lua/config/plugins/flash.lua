return {
  {
    "folke/flash.nvim",
    config = function()
      require("flash").setup({
        modes = {
          search = {
            enabled = true
          },
          char = {
            jump_labels = true
          },
        },
      })

      vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
      vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash treesitter" })
      vim.keymap.set({ "o" }, "r", function() require("flash").remote() end, { desc = "Remote flash" })
      vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end,
        { desc = "Treesitter flash" })
      vim.keymap.set({ "c" }, "<C-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

      vim.keymap.set({ "n" }, "<leader>n", function()
        require("flash").jump({
          search = { mode = "search", max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = "^"
        })
      end, { desc = "Jump to a line" })
    end,
  }
}
