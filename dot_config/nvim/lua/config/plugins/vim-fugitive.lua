return {
  {
    "tpope/vim-fugitive",
    config = function()
      -- Old toggle function replaced by a fancy autocommand
      -- local toggle_fugitive = function()
      --   local windows = vim.api.nvim_list_wins()
      --   for _, v in pairs(windows) do
      --     local status, _ = pcall(vim.api.nvim_win_get_var, v, "fugitive_status")
      --     if status then
      --       vim.api.nvim_win_close(v, false)
      --       return
      --     end
      --   end
      --   vim.cmd([[Git]])
      -- end

      local in_git_repo = function()
        vim.fn.system("git rev-parse --is-inside-work-tree")
        return vim.v.shell_error == 0
      end
      if in_git_repo() then
        vim.keymap.set("n", "<leader>gg", [[:Git<CR>]], { desc = "Open fugitive window", silent = true })
        vim.keymap.set("n", "<leader>gl", [[:Git log --graph --branches --remotes --tags --oneline --decorate<CR>]],
          { desc = "[G]it [L]og", silent = true })
      end
    end,
  }
}
