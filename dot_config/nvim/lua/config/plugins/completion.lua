return {
  {
    "saghen/blink.cmp",
    dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
    version = "1.*",
    config = function()
      -- load local snippets
      -- local vs_snip_path = vim.fn.stdpath("config") .. "/snippets"
      -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vs_snip_path } })
      local lua_snip_path = vim.fn.stdpath("config") .. "/lua-snippets"
      require("luasnip.loaders.from_lua").load({ paths = lua_snip_path })

      require("luasnip").setup({
        history = true,
        update_events = { "TextChanged", "TextChangedI" },
        enable_autosnippets = true,
        ext_opts = {
          [require("luasnip.util.types").choiceNode] = {
            active = {
              virt_text = { { " <- Choice", "Comment" } },
            },
          },
        },
      })

      vim.keymap.set({ "i", "s" }, "<C-s>", function()
        if require("luasnip").choice_active() then
          require("luasnip").change_choice(1)
        end
      end, { desc = "snippet", silent = true })

      require("blink-cmp").setup({
        snippets = { preset = "luasnip" },
        keymap = {
          -- preset = "default",
          preset = "none",

          ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
          ["<C-e>"] = { "hide", "fallback" },
          ["<C-y>"] = { "select_and_accept", "fallback" },

          ["<Up>"] = { "select_prev", "fallback" },
          ["<Down>"] = { "select_next", "fallback" },
          ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
          ["<C-n>"] = { "select_next", "fallback_to_mappings" },

          ["<C-b>"] = { "scroll_documentation_up", "fallback" },
          ["<C-f>"] = { "scroll_documentation_down", "fallback" },

          ["<C-l>"] = { "snippet_forward", "fallback" },
          ["<C-h>"] = { "snippet_backward", "fallback" },

          ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
        },
        appearance = {
          nerd_font_variant = "mono",
        },
        completion = {
          menu = {
            draw = {
              padding = { 0, 1 }, -- padding only on right side
              components = {
                kind_icon = {
                  text = function(ctx)
                    return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
                  end,
                },
              },
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
          },
        },
        cmdline = {
          keymap = { preset = "inherit" },
          completion = { menu = { auto_show = true } },
        },
        signature = { enabled = true },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
      })
    end,
    -- opts_extend = { "sources.default" },
  },
}
