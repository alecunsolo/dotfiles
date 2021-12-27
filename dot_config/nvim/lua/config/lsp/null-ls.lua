local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- stylua: ignore
local lua_extra_args = {
  '--indent-type', 'Spaces',
  '--indent-width', '2',
  '--quote-style', 'AutoPreferSingle',
  '--column-width', '120',
}

null_ls.setup({
  debug = false,
  sources = {
    -- Formatting
    formatting.stylua.with({ extra_args = lua_extra_args }),
    formatting.terraform_fmt,
    -- Diagnostics
    diagnostics.ansiblelint,
  },
})
