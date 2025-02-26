-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls"}
local nvlsp = require "nvchad.configs.lspconfig"

--Database connection string for SQL lS(Optional)
local db_connection = os.getenv("NEON_DATABASE_URL") or "host=localhost port=5432 user=your_user dbname=your_db password=your_password sslmode=disable"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
 lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
   on_init = nvlsp.on_init,
   capabilities = nvlsp.capabilities,
 }

 -- Configuring `sqlls` separately for advanced settings (optional)
lspconfig.sqlls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    sqls = {
      connections = {
        {
          driver = "postgresql",  -- Change to "mysql" if using MySQL 
          dataSourceName = db_connection,
        }
      }
    }
  }
}

-- Configure Prisma LSP
lspconfig.prismals.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}