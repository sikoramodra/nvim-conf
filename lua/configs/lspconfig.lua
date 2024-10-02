-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
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

lspconfig.qmlls6.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
}

local servers = {
  "html",
  "cssls",
  "clangd",
  "cmake",
  "bashls",
  "dockerls",
  "docker_compose_language_service",
  "eslint",
  -- "hyprls",
  "jsonls",
  "svelte",
  "tailwindcss",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
