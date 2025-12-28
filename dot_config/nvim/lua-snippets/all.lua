---@diagnostic disable:undefined-global
return {
  s({ trig = "diso", desc = "ISO date timestamp" }, { p(os.date, "!%Y-%m-%dT%H:%M:%S") }),
  s({ trig = "year", desc = "Get current year" }, { p(os.date, "%Y") }),
  s(
    { trig = "copyright", desc = "Snippet to put copyright info" },
    fmt([[Copyright (c) {} {}. All Rights Reserved.]], {
      p(os.date, "%Y"),
      i(1, "author"),
    })
  ),
  s({ trig = "date", desc = "Put the date in various formats" }, {
    c(1, {
      p(os.date, "%d/%m/%Y"),
      p(os.date, "%d-%m-%Y"),
      p(os.date, "%Y-%m-%d"),
      p(os.date, "%Y/%m/%d"),
      p(os.date, "%Y%m%d"),
    }),
    i(0),
  }),
}
