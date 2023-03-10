--[[---------------------------------------------]]--
--         init.lua - Init file of NVim            --
--              Author: Jacopo Zacchinga           --
--                 License: GPLv3                  --
--[[---------------------------------------------]]--

local core_modules = {

---- Core Settings ----------------------------------
 "core/plugins",           -- Plugins + Packer Config
 "core/keymaps",           -- Custom Keymaps
 "core/options",           -- General Options

---- Plugin Configurations --------------------------
 "configs/treesitter",     -- Syntax Highlighting
 "configs/impatient",      -- Improve Startup Time
 "configs/nvimtree",       -- File Explorer
 "configs/markdown",       -- General configurations
 "configs/alpha",          -- Wellcome Screen
 "configs/gitsigns",       -- Git Integration
 "configs/commentary",     -- Easily Comment Lines
 "configs/statusline",     -- Status Line
 "configs/colorizer",      -- Colors Highlighter
 "configs/neoscroll",      -- Smooth Scrolling
 "configs/telescope",      -- Fuzzy finder
 "configs/barbar",         -- Tab-bar for the buffers
 "configs/terminal",       -- Terminal

---- LSP Utilities --------------------------------
 "lsp/lsp_zero_config",        -- Automatica setup config
 -- "lsp/completion",         -- Auto Completion
 -- "lsp/handlers",           -- Beautify

---- Other Utilities --------------------------------
 "utils/utils",            -- Utilities
}


-- Using pcall we can handle better any loading issues
for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
      return
    end
end

-- Vim command to open new MarkdownPreview window
-- vim.cmd([[
--	function OpenMarkdownPreview (url)
--	    execute "! open -n " . a:url
--	endfunction
--	    let g:mkdp_browserfunc = 'OpenMarkdownPreview'
--]])
