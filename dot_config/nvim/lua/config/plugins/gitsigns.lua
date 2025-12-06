return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()

      ---@diagnostic disable-next-line:param-type-mismatch
      vim.keymap.set("n", "]h", function() require('gitsigns').nav_hunk('next') end, { desc = "Jump to the next hunk" })
      ---@diagnostic disable-next-line:param-type-mismatch
      vim.keymap.set("n", "[h", function() require("gitsigns").nav_hunk("prev") end,
        { desc = "Jump to the previous hunk" })

      vim.keymap.set("n", "<leader>gs", function() require('gitsigns').stage_hunk() end,
        { desc = "Stage/Unstage hunks", silent = true })
      vim.keymap.set("n", "<leader>gbl", function() require('gitsigns').blame_line({ ignore_whitespace = true }) end,
        { desc = "Blame current line", silent = true })
      vim.keymap.set("n", "<leader>gb!", function() require('gitsigns').toggle_current_line_blame() end,
        { desc = "Toggle blame line", silent = true })
      vim.keymap.set("n", "<leader>gp", function() require('gitsigns').preview_hunk_inline() end,
        { desc = "Preview hunk", silent = true })
      vim.keymap.set("n", "<leader>gq", function() require('gitsigns').setqflist() end,
        { desc = "Send current buffer hunks to quickfix list", silent = true })
    end
  }
}
