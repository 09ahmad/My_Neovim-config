local conform = require("conform")

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    tsx = { "prettier" },
    jsx = { "prettier" },
  },

  formatters = {
    prettier = {
      command = "prettier", -- or "./node_modules/.bin/prettier" if local
      args = { "--stdin-filepath", "$FILENAME" },
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

-- Create the :Format command
vim.api.nvim_create_user_command("Format", function()
  conform.format()
end, {})

return options