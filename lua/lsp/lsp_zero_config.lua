---
-- Configure LSP servers
---

require('lsp-zero').extend_lspconfig()

require('mason').setup()
require('mason-lspconfig').setup()

local get_servers = require('mason-lspconfig').get_installed_servers
for _, server_name in ipairs(get_servers()) do
  require('lspconfig')[server_name].setup({})
end

---
-- Diagnostic config
---

require('lsp-zero').set_sign_icons()
vim.diagnostic.config(require('lsp-zero').defaults.diagnostics({}))

---
-- Snippet config
---

require('luasnip').config.set_config({
  region_check_events = 'InsertEnter',
  delete_check_events = 'InsertLeave'
})

require('luasnip.loaders.from_vscode').lazy_load()

---
-- Autocompletion
---

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')
local cmp_config = require('lsp-zero').defaults.cmp_config({})

cmp.setup(cmp_config)
