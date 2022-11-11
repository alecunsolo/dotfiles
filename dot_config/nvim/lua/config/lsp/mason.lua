local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
  vim.notify('Failed to init mason')
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local mason_lsp_status_ok, mason_lsp = pcall(require, 'mason-lspconfig')
if not mason_lsp_status_ok then
  vim.notify('Failed to init mason-lspconfig')
  return
end

mason_lsp.setup({
  ensure_installed = {}
})

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  vim.notify('Failed to init lspconfig')
  return
end

for _, server in ipairs(mason_lsp.get_installed_servers()) do
  lspconfig[server].setup {}
end
