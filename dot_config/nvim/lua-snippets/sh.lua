---@diagnostic disable:undefined-global
return {
  s({ trig = "ube", desc = "Add shebang" }, { t("#!/usr/bin/env bash") }),
  s(
    { trig = "fore", desc = "For-each construct" },
    fmta(
      [[
      for <> in "${<>[@]}"; do
      <>
      done
    ]],
      {
        i(1, "var"),
        i(2, "array"),
        sn(0, { t("\t"), i(1) }),
      }
    )
  ),
}
