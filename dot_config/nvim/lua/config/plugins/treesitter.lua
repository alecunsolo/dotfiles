return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local languages = {
        "awk",
        "bash",
        "c",
        "cvs",
        "diff",
        "dockerfile",
        "editorconfig",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gpg",
        "groovy",
        "hcl",
        "helm",
        "html",
        "http",
        "ini",
        "java",
        "javascript",
        "jinja",
        "jinja_inline",
        "jq",
        "json",
        "just",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nginx",
        "python",
        "ruby",
        "sql",
        "ssh_config",
        "terraform",
        "tmux",
        "toml",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "zsh",
      }

      require("nvim-treesitter").install(languages)

      -- do Treesitter stuff only if we have a parser installed
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local treesitter = require("nvim-treesitter")
          local lang = vim.treesitter.language.get_lang(args.match)
          if vim.list_contains(treesitter.get_installed(), lang) then
            vim.treesitter.start(args.buf)
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            local expr = require("nvim-treesitter").indentexpr() or 0
            if expr > 0 then
              vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
          end
        end,
      })
    end,
  },
}
