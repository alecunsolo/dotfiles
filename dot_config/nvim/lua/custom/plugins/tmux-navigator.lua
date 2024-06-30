return {
  "christoomey/vim-tmux-navigator",
  config = function()
    -- Save on switch
    vim.g.tmux_navigator_save_on_switch = 1
    -- Disable when zoomed
    vim.g.tmux_navigator_disable_when_zoomed = 1
  end,
}
