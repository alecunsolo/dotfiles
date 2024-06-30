return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>ht", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "[H]arpoon - [T]oggle UI" })
    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "[H]arpoon - [A]dd mark" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end, { desc = "[H]arpoon - [P]revious" })
    vim.keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end, { desc = "[H]arpoon - [N]ext" })

    -- Set <leader>1..<leader>5 be my shortcuts to moving to the files
    for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
      vim.keymap.set("n", string.format("<leader>%d", idx), function()
        harpoon:list():select(idx)
      end, { desc = "[H]arpoon - [%s] file" })
    end
  end,
}
