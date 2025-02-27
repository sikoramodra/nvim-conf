local options = {
  -- formatters = {
  --   qmlformat = {
  --     command = "qmlformat",
  --     args = { "-i", "$FILENAME" },
  --     stdin = false,
  --     tmpfile_format = ".conform.$RANDOM.$FILENAME",
  --   },
  -- },

  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    -- cpp = { "clang-format" },
    -- cmake = { "cmake_format" },
    -- cmake = { "gersemi" },
    -- qml = { "qmlformat" },
    bash = { "shfmt", "beautysh" },
    json = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    go = { "gofumpt", "goimports-reviser", "golines" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
