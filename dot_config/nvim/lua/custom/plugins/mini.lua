return {
  {
    "echasnovski/mini.nvim",
    config = function()
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()

      require("mini.bufremove").setup()
      vim.keymap.set("n", "<leader>mu", function()
        MiniBufremove.unshow()
      end, { desc = "[M]ini - Bufremove [u]nshow" })

      require("mini.pairs").setup({
        mappings = {
          ["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
          [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
        },
      })
    end,
  },
}
