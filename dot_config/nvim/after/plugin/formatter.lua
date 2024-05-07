require("conform").setup({
  format_on_save = function(bufnr)
    if vim.g.conform_save_on_write_disabled then
      return
    end
    -- Disable "format_on_save lsp_fallback" for languages that don't
    -- have a well standardized coding style. You can add additional
    -- languages here or re-enable it for the disabled ones.
    local disable_filetypes = { c = true, cpp = true }
    return {
      timeout_ms = 500,
      lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    }
  end,
  formatters_by_ft = {
    ["lua"] = { "stylua" },
    ["terraform-vars"] = { { "terraform_fmt", "tofu_fmt" } },
    ["terraform"] = { { "terraform_fmt", "tofu_fmt" } },
    ["hcl"] = { "terragrunt_hclfmt" },
    -- Conform can also run multiple formatters sequentially
    -- python = { "isort", "black" },
    --
    -- You can use a sub-list to tell conform to run *until* a formatter
    -- is found.
    -- javascript = { { "prettierd", "prettier" } },
  },
})

vim.api.nvim_create_user_command("FormatToggle", function()
  vim.g.conform_save_on_write_disabled = not vim.g.conform_save_on_write_disabled
  if vim.g.conform_save_on_write_disabled then
    print("Format on save is now disabled")
  else
    print("Format on save is now enabled")
  end
end, {
  desc = "Toggle autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatDisable", function()
  vim.g.conform_save_on_write_disabled = true
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
  vim.g.conform_save_on_write_disabled = false
end, {
  desc = "Re-enable autoformat-on-save",
})

vim.api.nvim_create_user_command("FormatStatus", function()
  if vim.g.conform_save_on_write_disabled then
    print("Format on save is disabled")
  else
    print("Format on save is enabled")
  end
end, {
  desc = "Re-enable autoformat-on-save",
})


vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[F]ormat file " })
