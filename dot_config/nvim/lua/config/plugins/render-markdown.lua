return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    config = function()
      require("render-markdown").setup({
        completions = { lsp = { enabled = true } },
      })

      vim.keymap.set("n", "<leader>mt", function()
        require("render-markdown").buf_toggle()
      end, { desc = "[M]arkdown render [T]oggle", silent = true })
      vim.keymap.set("n", "<leader>mp", function()
        require("render-markdown").preview()
      end, { desc = "[M]arkdown render [P]review", silent = true })
    end,
  },
}
