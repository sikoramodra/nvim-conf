-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "clangd",
  "cmake",
  "bashls",
  "dockerls",
  "docker_compose_language_service",
  "eslint",
  "hyprls",
  "jsonls",
  "svelte",
  "tailwindcss",
  "ts_ls",
  "qmlls6",
}
local nvlsp = require "nvchad.configs.lspconfig"

local configs = require "lspconfig.configs"
if not configs.qmlls6 then
  configs.qmlls6 = {
    default_config = {
      cmd = { "qmlls6" },
      filetypes = { "qml" },
      root_dir = lspconfig.util.root_pattern ".git",
    },
  }
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
