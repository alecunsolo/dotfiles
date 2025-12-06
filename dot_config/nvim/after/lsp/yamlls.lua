--- Currently, kubernetes is special-cased in yammls, see the following upstream issues:
--- * [#211](https://github.com/redhat-developer/yaml-language-server/issues/211).
--- * [#307](https://github.com/redhat-developer/yaml-language-server/issues/307).
---
--- To override a schema to use a specific k8s schema version (for example, to use 1.18):
---
--- ```lua
--- vim.lsp.config('yamlls', {
---   settings = {
---     yaml = {
---       ... -- other settings. note this overrides the lspconfig defaults.
---       schemas = {
---         ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] = "/*.k8s.yaml",
---         ... -- other schemas
---       },
---     },
---   }
--- })
--- ```
return {
  settings = {
    yaml = {
      schemas = {
        -- ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] = "/*.k8s.yaml",
        -- kubernetes = "/*.ya?ml",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] = "/*.yaml",
        ["https://www.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
      },
    },
  },
}
