---@diagnostic disable:undefined-global
return {
  s({ trig = "F", desc = "Add FROM clause" }, fmt("FROM {}", { i(1, "image") })),
  s({ trig = "C", desc = "Add COPY clause" }, fmt("COPY {} {}", { i(1, "src"), i(2, "dest") })),
  s({ trig = "A", desc = "Add ADD clause" }, fmt("ADD {} {}", { i(1, "src"), i(2, "dest") })),
  s({ trig = "EX", desc = "Add EXPOSE clause" }, fmt("EXPOSE {}", { i(1, "port") })),
  s({ trig = "U", desc = "Add USER clause" }, fmt("USER {}", { i(1, "user") })),
  s({ trig = "W", desc = "Add WORKDIR clause" }, fmt("WORKDIR {}", { i(1, "dir") })),
  s({ trig = "ENV", desc = "Add ENV clause" }, fmt("ENV {} {}", { i(1, "key"), i(2, "value") })),
  s(
    { trig = "AR", desc = "Add ARG clause" },
    fmt("ARG {}{}", { i(1, "key"), c(2, { t(""), sn(nil, { t(" "), i(1, "value") }) }) })
  ),
  s({ trig = "CM", desc = "Add CMD clause" }, fmt('CMD ["{}"]', { i(1, "cmd") })),
  s({ trig = "ENT", desc = "Add ENTRYPOINT clause" }, fmt('ENTRYPOINT ["{}"]', { i(1, "cmd") })),
  s({ trig = "R", desc = "Add RUN clause" }, fmt("RUN {}", { i(1, "cmd") })),
}
