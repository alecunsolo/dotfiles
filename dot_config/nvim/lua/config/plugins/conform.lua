return {
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          ['yaml.ansible'] = { 'asible_lint' },
          lua = { "stylua" },
          terraform = { "terraform_fmt", "tofu_fmt", stop_after_first = true },
          -- Conform will run multiple formatters sequentially
          -- python = { "isort", "black" },
          -- You can customize some of the format options for the filetype (:help conform.format)
          -- rust = { "rustfmt", lsp_format = "fallback" },
          -- Conform will run the first available formatter
          -- javascript = { "prettierd", "prettier", stop_after_first = true },
        },
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = "fallback",
        },
      })
    end
  }
}
