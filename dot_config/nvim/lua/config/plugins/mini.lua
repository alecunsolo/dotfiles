return {
  {
    "nvim-mini/mini.nvim",
    version = "*",
    config = function()
      -- mini.ai
      require("mini.ai").setup()
      -- mini.surround
      require("mini.surround").setup({
        custom_surroundings = {
          ["j"] = {
            input = { "{{().-()}}" },
            output = { left = "{{", right = "}}" },
          },
          ["J"] = {
            input = { "{{().-()}}" },
            output = { left = "{{ ", right = " }}" },
          },
        },
        search_method = "cover_or_next",
      })
      -- mini.trailspace
      require("mini.trailspace").setup()
      -- mini.pairs
      require("mini.pairs").setup({
        mappings = {
          ["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
          [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },

          -- Workaround to insert 3 characters insteaod of four
          -- https://github.com/nvim-mini/mini.nvim/discussions/255#discussioncomment-9686309
          ['"'] = { action = "closeopen", pair = '""', neigh_pattern = '[^\\"].', register = { cr = false } },
          ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\`].", register = { cr = false } },
          ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^\\'].", register = { cr = false } },
        },
      })
      -- mini.icons
      require("mini.icons").setup()
      -- mini.statusline
      -- require('mini.statusline').setup()
      -- mini.comments
      require("mini.comment").setup({
        options = {
          ignore_blank_line = true,
        },
      })
      -- mini.hipatterns
      local hipatterns = require("mini.hipatterns")
      hipatterns.setup({
        highlighters = {
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      })
    end,
  },
}
