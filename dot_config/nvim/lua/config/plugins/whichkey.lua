return {
  {
    "folke/which-key.nvim",
    -- dependencies = {
    --   { 'nvim-mini/mini.icons', version = '*' },
    -- },
    config = function()
      require("which-key").setup()

      vim.keymap.set("n", "<leader>?", function()
        require("which-key").show({ global = false })
      end, { desc = "Buffer Local Keymaps (which-key)" })
    end,
  }
}
