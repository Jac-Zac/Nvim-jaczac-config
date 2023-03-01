local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup {}

-- 2. (optional) Override the default configuration to be applied to all servers.
lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    {
        on_attach = on_attach
    }
)

-- 3. Loop through all of the installed servers and set it up via lspconfig
for _, server in ipairs(lsp_installer.get_installed_servers()) do
    -- tmp fix to avoid problems
    if server.name ~= "sumneko_lua" then
        local opts = {
            on_attach = require("lsp.handlers").on_attach,
            capabilities = require("lsp.handlers").capabilities,
        }

        lspconfig[server.name].setup(opts)
    end
end

-- Set up Null-ls
-- local null_ls = require("null-ls")
--
-- local formatting = null_ls.builtins.formatting
--
-- local sources = {
-- 	formatting.eslint,
-- 	formatting.clang_format,
-- 	formatting.prettier,
-- 	formatting.black,
-- 	-- formatting.latexindent,
-- }
--
-- null_ls.setup({
-- 	sources = sources,
--
-- 	on_attach = function(client)
-- 		if client.resolved_capabilities.document_formatting then
-- 			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()")
-- 		end
-- 	end,
-- })
