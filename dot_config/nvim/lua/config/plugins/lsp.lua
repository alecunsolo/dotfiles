return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      vim.lsp.set_log_level(vim.lsp.log_levels.OFF)
      local servers = {
        "ansiblels",
        "bashls",
        "lua_ls",
        "terraformls",
        "yamlls",
      }

      -- :help lsp-defaults
      vim.lsp.enable(servers)

      vim.diagnostic.config({
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
        underline = { severity = vim.diagnostic.severity.ERROR },
        virtual_text = {
          source = "if_many",
          -- source = true,
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
        virtual_lines = false,
        signs = {
          text = {
            -- [vim.diagnostic.severity.ERROR] = '󰅚 ',
            -- [vim.diagnostic.severity.WARN] = '󰀪 ',
            -- [vim.diagnostic.severity.INFO] = '󰋽 ',
            -- [vim.diagnostic.severity.HINT] = '󰌶 ',

            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      })

      -- Stuff to do when an LspAttach event is intercepted
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp", {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
          end

          -- Mostly defauts, with Telescope variations if available
          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

          local ok, builtin = pcall(require, "telescope.builtin")
          if ok then
            -- Find references for the word under your cursor.
            map("grr", builtin.lsp_references, "[G]oto [R]eferences")

            -- Jump to the implementation of the word under your cursor.
            --  Useful when your language has ways of declaring types without an actual implementation.
            map("gri", builtin.lsp_implementations, "[G]oto [I]mplementation")

            -- Fuzzy find all the symbols in your current document.
            --  Symbols are things like variables, functions, types, etc.
            map("gO", builtin.lsp_document_symbols, "Open Document Symbols")

            -- Fuzzy find all the symbols in your current workspace.
            --  Similar to document symbols, except searches over your entire project.
            map("gW", builtin.lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

            -- Jump to the type of the word under your cursor.
            --  Useful when you're not sure what type a variable is and you want to see
            --  the definition of its *type*, not where it was *defined*.
            map("grt", builtin.lsp_type_definitions, "[G]oto [T]ype Definition")
          else
            map("grr", vim.lsp.buf.references, "[G]oto [R]eferences")
            map("gri", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
            map("gO", vim.lsp.buf.document_symbol, "Open Document Symbols")
            map("gW", vim.lsp.buf.workspace_symbol, "Open Workspace Symbols")
            map("grt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
          end

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, args.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = args.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = args.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
              end,
            })
          end
        end,
      })

      -- Manual Formatting
      vim.keymap.set("n", "<leader>F", function()
        local ok, conform = pcall(require, "conform")
        if ok then
          conform.format({ timeout_ms = 1000, lsp_format = "fallback" })
        else
          vim.lsp.buf.format({ timeout_ms = 1000 })
        end
        vim.lsp.buf.format()
      end, { desc = "Format file" })
    end,
  },
}
