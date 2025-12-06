local module_from_repo = function(args)
  local full_repo = args[1][1] or ""
  local parts = vim.split(full_repo, "/", { plain = true })
  local repo = parts[#parts]
  parts = vim.split(repo, ".", { plain = true })
  return parts[1]
end

---@diagnostic disable:undefined-global
return {
  s({ trig = "req", desc = "Add require block" }, fmt('require("{}")', { i(1, "module") })),
  s(
    { trig = "lazyp", desc = "Insert a Lazy plugin spec" },
    fmta(
      [[
    return {
      {
        "<>",
        config = function()
          require("<>").setup({})<>
        end
      }
    }
    ]],
      {
        i(1, "repository"),
        -- i(2, "module"),
        f(module_from_repo, { 1 }),
        i(0),
      }
    )
  ),
}
