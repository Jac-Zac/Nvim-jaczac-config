--[[--------------------------------------]] --
--     plugins + packer - configuration     --
--     Author: elai, ChristianChiarulli     --
--             License: GPLv3               --
--[[--------------------------------------]] --

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)

    -- My plugins
    use "wbthomason/packer.nvim" -- A use-package inspired plugin manager for Neovim


    --  All the plugins I use
    use 'shaunsingh/nord.nvim'                      -- Nord theme
    use 'rcarriga/nvim-notify'                      -- nvim-notify for notification
    use "kyazdani42/nvim-web-devicons"              -- Lua fork of vim-web-devicons for neovim
    use "kyazdani42/nvim-tree.lua"                  -- A file explorer tree for neovim written in lua
    use "goolord/alpha-nvim"                        -- Lua powered greeter like vim-startify / dashboard-nvim
    use "norcalli/nvim-colorizer.lua"               -- Colors highlighter for neovim
    use "lewis6991/impatient.nvim"                  -- Speed up loading Lua modules to improve startup time
    use "karb94/neoscroll.nvim"                     -- Smooth scrolling plugin written in lua
    use 'nvim-telescope/telescope.nvim'             -- Find, filter, preview, pick. all lua, with telescope
    use 'nvim-lua/plenary.nvim'                     -- Plenary, a dependency of telescope
    use "nvim-telescope/telescope-file-browser.nvim"-- Telescope file browser
    use "terrortylor/nvim-comment"                  -- Comment toggler for Neovim written in Lua
    use "nvim-treesitter/nvim-treesitter"           -- Treesitter Syntax highlighting and abstraction layer
    use 'ggandor/lightspeed.nvim'                   -- Fast Search
    use 'lervag/vimtex'                             -- Latex completion and viewer

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }) -- markdown-preview
    use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }) -- Cool looking icons
    use({ "kylechui/nvim-surround", tag = "*", config = function() require("nvim-surround").setup({}) end }) -- Easy way to surround and delete things around a selection or inside functions
    use({ 'lewis6991/gitsigns.nvim', event = { "CursorMoved", "CursorMovedI" },
        config = function() require("gitsigns") end }) -- Git integration for buffers
    use({ 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }) -- Buffer bars


    -- Lsp
    use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
    }

    -- Complition
    use({ 'hrsh7th/nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lsp' })
    use({ 'hrsh7th/cmp-buffer' })
    use({ 'hrsh7th/cmp-path' })

    -- Snippets
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
--    use "rafamadriz/friendly-snippets" -- friendly-snippets

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
