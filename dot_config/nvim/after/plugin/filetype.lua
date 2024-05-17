-- ####################
-- # CUSTOM FILETYPES #
-- ####################
require("os")
vim.filetype.add({
  filename = {
    [os.getenv("HOME") .. "/.kube/config"] = "yaml", -- Only for this exact path
  },
  pattern = {
    ["Jenkinsfile.*"] = "groovy",
    [".*/.ssh/config.d/.*"] = "sshconfig",
    -- Ansible
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/handlers/.*%.ya?ml"] = "yaml.ansible",
  },
})
