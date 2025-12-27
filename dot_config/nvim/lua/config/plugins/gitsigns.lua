---@diagnostic disable:param-type-mismatch
return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      -- Navigation
      vim.keymap.set("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          require("gitsigns").nav_hunk("next")
        end
      end)
      vim.keymap.set("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
        end
      end)

      -- Actions
      vim.keymap.set("n", "<leader>gs", function()
        require("gitsigns").stage_hunk()
      end, { desc = "Stage/Unstage hunks", silent = true })

      vim.keymap.set("n", "<leader>gbl", function()
        require("gitsigns").blame_line({ ignore_whitespace = true })
      end, { desc = "Blame current line", silent = true })

      vim.keymap.set("n", "<leader>gq", function()
        require("gitsigns").setqflist()
      end, { desc = "send current buffer hunks to quickfix list", silent = true })
      vim.keymap.set("n", "<leader>gQ", function()
        require("gitsigns").setqflist("all")
      end, { desc = "send current all hunks to quickfix list", silent = true })

      -- Preview hunks
      vim.keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk, { desc = "Preview Hunk", silent = true })
      vim.keymap.set(
        "n",
        "<leader>gi",
        require("gitsigns").preview_hunk_inline,
        { desc = "Preview Hunk Inline", silent = true }
      )

      -- Diff against the index
      vim.keymap.set(
        "n",
        "<leader>gd",
        require("gitsigns").diffthis,
        { desc = "Diff against the index", silent = true }
      )
      -- Diff against the last commit
      vim.keymap.set("n", "<leader>gD", function()
        require("gitsigns").diffthis("~")
      end, { desc = "Diff against the last commit", silent = true })

      -- Toggles
      vim.keymap.set("n", "<leader>gb!", function()
        require("gitsigns").toggle_current_line_blame()
      end, { desc = "Toggle blame line", silent = true })
      vim.keymap.set(
        "n",
        "<leader>tw",
        require("gitsigns").toggle_word_diff,
        { desc = "Toggle word diff", silent = true }
      )

      -- Text object
      vim.keymap.set({ "o", "x" }, "ih", require("gitsigns").select_hunk, { desc = "Select Hunk", silent = true })
    end,
  },
}
