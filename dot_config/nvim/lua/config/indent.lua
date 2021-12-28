local status_ok, indent = pcall(require, 'indent_blankline')
if not status_ok then
  vim.notify('Failed to load plugin "indent_blankline"')
  return
end

indent.setup({
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
  space_char_blankline = ' ',
  filetype_exclude = {
    'help',
    'NvimTree',
    'packer',
    'TelescopePrompt',
    'TelescopeResults',
  },
})
