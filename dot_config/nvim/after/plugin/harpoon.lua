local ok, harpoon = pcall(require, "harpoon")
if not ok then
  return
end

harpoon.setup {}
-- Harpoon mappings
vim.keymap.set('n', '<leader>ha', require("harpoon.mark").add_file, { desc = '[H]arpoon - [A]dd mark' })
vim.keymap.set('n', '<leader>ht', require("harpoon.ui").toggle_quick_menu, { desc = '[H]arpoon - [T]oggle UI' })

for i = 1, 5 do
  vim.keymap.set('n',
    string.format("<leader>%s", i),
    function()
      require("harpoon.ui").nav_file(i)
    end,
    { desc = string.format('[H]arpoon - [%s] file', i) })
end
