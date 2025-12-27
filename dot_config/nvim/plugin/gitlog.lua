local in_git_repo = function()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  return vim.v.shell_error == 0
end

local git_lol = function()
  -- Get the dimensions of the editor
  local editor_width = vim.o.columns
  local editor_height = vim.o.lines

  -- Set the dimensions of the floating window
  local width = math.floor(editor_width * 2 / 3)
  local height = math.floor(editor_height * 2 / 3)

  -- Calculate the row and column to center the window
  local row = math.floor((editor_height - height) / 2)
  local col = math.floor((editor_width - width) / 2)

  -- Set up window options with centering
  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  }

  -- Create an empty buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Open the floating window with the empty buffer
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Enable wrapping
  vim.api.nvim_set_option_value("wrap", true, { win = win })

  -- Get git log
  vim.cmd.terminal([[git --no-pager log --oneline --all --graph --decorate]])

  -- Do not list the buffer in :ls
  vim.bo.buflisted = false

  -- Close the buffer with `q` or `Esc`

  local close_log = function()
    vim.cmd("close")
    pcall(vim.api.nvim_buf_delete, buf, { force = true })
  end

  local show_commit = function()
    local cur_word = vim.fn.expand("<cword>")
    print(cur_word)
  end
  vim.keymap.set({ "n", "t" }, "q", close_log, { buffer = buf, silent = true, desc = "Quit buffer" })
  vim.keymap.set({ "n", "t" }, "<Esc>", close_log, { buffer = buf, silent = true, desc = "Quit buffer" })
  vim.keymap.set({ "n", "t" }, "o", show_commit, { buffer = buf, silent = true, desc = "Quit buffer" })
end

local git_show_log = function()
  if in_git_repo() then
    git_lol()
  else
    print("Not in a git repo")
  end
end

vim.api.nvim_create_user_command("GitGraph", git_show_log, {})
vim.keymap.set("n", "<leader>gP", git_show_log, { desc = "[G]it log - gra[P]h", silent = true })
