return {
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()

      vim.keymap.set(
        "n",
        "<leader>tx",
        [[:Trouble diagnostics toggle<cr> ]],
        { desc = "Diagnostics (Trouble)", silent = true }
      )
      vim.keymap.set(
        "n",
        "<leader>tX",
        [[:Trouble diagnostics toggle filter.buf=0<cr> ]],
        { desc = "Buffer Diagnostics (Trouble)", silent = true }
      )
      vim.keymap.set("n", "<leader>tt", [[:Trouble todo toggle<cr> ]], { desc = "Trouble TODO", silent = true })
    end,
  },
}
