return {
  {
    "lukas-reineke/virt-column.nvim",
    enabled = true,
    config = function()
      require("virt-column").setup({
        virtcolumn = "80",
        highlight = "LineNr",
        exclude = {
          filetypes = {
            "fugitive",
            "oil",
          },
        },
      })
    end,
  },
}
