local status_ok, comments = pcall(require, 'Comment')
if not status_ok then
  vim.notify('Failed to load "comments"')
  return
end

local ft = require('Comment.ft')
ft.set('ldif', '#%s')

comments.setup()
