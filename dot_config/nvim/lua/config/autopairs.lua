local status_ok, npairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  vim.notify('Failed to load "nvim-autopairs" plugin')
  return
end

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string', 'source' },
  },
  disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
})

-- Add spaces between parenthesis
-- https://github.com/windwp/nvim-autopairs/wiki/Custom-rules#add-spaces-between-parentheses
local rule_status_ok, Rule = pcall(require, 'nvim-autopairs.rule')
if not rule_status_ok then
  vim.notify('Failed to load "nvim-autopairs.rule"')
  return
end
local cond_status_ok, cond = pcall(require, 'nvim-autopairs.conds')
if not cond_status_ok then
  vim.notify('Failed to load "nvim-autopairs.rule"')
  return
end
npairs.add_rules({
  Rule(' ', ' ')
    :with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '{}', '[]', '<>'}, pair)
    end)
    :with_move(cond.none())
    :with_cr(cond.none())
    :with_del(function(opts)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local context = opts.line:sub(col - 1, col + 2)
      return vim.tbl_contains({ '(  )', '{  }', '[  ]', '<  >'}, context)
    end),
  Rule('', ' )')
    :with_pair(cond.none())
    :with_move(function(opts)
      return opts.char == ')'
    end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key(')'),
  Rule('', ' }')
    :with_pair(cond.none())
    :with_move(function(opts)
      return opts.char == '}'
    end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key('}'),
  Rule('', ' ]')
    :with_pair(cond.none())
    :with_move(function(opts)
      return opts.char == ']'
    end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key(']'),
  Rule('', ' >')
    :with_pair(cond.none())
    :with_move(function(opts)
      return opts.char == ']'
    end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key('>'),

  -- Angular bracket
  Rule('<', '>')
})


local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
