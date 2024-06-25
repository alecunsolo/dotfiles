require("lualine").setup({
  options = {
    theme = "tokyonight",
  },
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
      "encoding",
      "fileformat",
      "filetype",
    },
  },
})