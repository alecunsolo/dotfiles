return {
  {
    "tpope/vim-fugitive",
    config = function()
      -- Git
      vim.keymap.set("n", "<leader>gg", function()
        local windows = vim.api.nvim_list_wins()
        for _, v in pairs(windows) do
          local status, _ = pcall(vim.api.nvim_win_get_var, v, "fugitive_status")
          if status then
            vim.api.nvim_win_close(v, false)
            return
          end
        end
        vim.cmd([[Git]])
      end, { desc = "[G]it to[G]gle" })
      vim.keymap.set(
        "n",
        "<leader>gl",
        [[:Git log --graph --branches --remotes --tags --oneline --decorate<CR>]],
        { desc = "[G]it [L]og" }
      )
    end,
  },
  "tpope/vim-rhubarb",
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end)
        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end)

        map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "[H]unk reset" })
        map("v", "<leader>hs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "[H]unk stage" })
        map("v", "<leader>hr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "[H]unk reset" })
        map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "[S]tage buffer" })
        map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "[H]unk [U]ndo stage hunk" })
        map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "[H]unk [R]eset buffer" })
        map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "[H]unk [P]review" })
        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, { desc = "[H]unk [B]lame" })
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle line [B]lame" })
        map("n", "<leader>hd", gitsigns.diffthis, { desc = "[H]unk [D]iffthis" })
        map("n", "<leader>hD", function()
          gitsigns.diffthis("~")
        end, { desc = "[H]unk [D]iffthis HEAD" })
        map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "[T]oggle [D]eleted" })
      end,
    },
  },
}
