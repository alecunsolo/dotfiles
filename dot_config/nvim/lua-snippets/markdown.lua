---@diagnostic disable:undefined-global
return {
  s({ trig = "link", desc = "Add link" }, fmt("[{}]({})", { i(1, "text"), i(2, "href") })),
  s({ trig = "cc", desc = "Insert code text" }, fmt("`{}`", { i(1, "text") })),
  s(
    { trig = "cb", desc = "Insert code block" },
    fmt(
      [[
      ```{}
      {}
      ```
    ]],
      { i(1), i(0) }
    )
  ),
  s({
    trig = "h([1-6])",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = conds.line_begin,
  }, {
    f(function(_, snip)
      local level = tonumber(snip.captures[1]) or 1
      return string.rep("#", level) .. " "
    end, {}),
    i(1, "Header text"),
  }),
}
