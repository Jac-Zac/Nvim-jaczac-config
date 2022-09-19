--[[------------------------------------]]--
--       keymaps - general mappings       --
--             Author: elai               --
--            License: GPLv3              --
--[[------------------------------------]]--

-- Shorten function name
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader key
map("", "<Space>", "<Nop>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------
-- Normal Mode --
-----------------
map("n", "<F1>", ":setlocal spell spelllang=en_us<CR>", {})
map("n", "<F2>", ":setlocal spell spelllang=it<CR>", {})
map("n", "<F3>", ":NvimTreeOpen<CR>", {})
map("n", "<F4>", ":! open $(echo % <bar> sed 's/.tex/.pdf/') & <CR>", {})
map("n", "<F5>", ":MarkdownPreview<CR>", {})

-- Mappings for moving through splits
map("n", "<A-h>", "<C-w>h", {})
map("n", "<A-j>", "<C-w>j", {})
map("n", "<A-k>", "<C-w>k", {})
map("n", "<A-l>", "<C-w>l", {})

-- Resize current buffer by +/- 2
map("n", "<C-h>", ":vertical resize +2<cr>", {})
map("n", "<C-j>", ":resize +2<cr>", {})
map("n", "<C-k>", ":resize -2<cr>", {})
map("n", "<C-l>", ":vertical resize -2<cr>", {})

-- Toggle Alpha Dashboard
map('n', "<leader>a", ":set laststatus=3<CR> | :Alpha<CR>", {})

-- Toggle NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", {})

map("n", "<leader>m", ":MarkdownPreview<CR>", {})

-- Yank entire line
map("n", "yie", ":<C-u>%y<CR>", {})

-- Packer Update
map("n", "<leader>u", ":PackerSync<CR>", {})

-- Telescope Mappings
map("n", "<Leader>b", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", {}) -- preview buffers
map("n", "<Leader>of", "<cmd>lua require'telescope.builtin'.oldfiles()<cr>", {}) -- old files
map("n", "<Leader>f", "<cmd>lua require'telescope.builtin'.find_files()<cr>", {}) -- Find files
map("n", "<Leader>l", "<cmd>lua require'telescope.builtin'.live_grep()<cr>", {}) -- Live grep into your folder
map("n", "<leader>gs", ":Telescope git_status<CR>", {}) -- git status

-----------------
-- Insert Mode --
-----------------
-- Map Escape Key To kj
map ("i", "kj", "<ESC>", {})

-- Fix One [Car] behind
map ("i", "<Esc>", "<Esc>`^", {})

-- Center screen after search
vim.cmd([[
nnoremap n nzzzv
nnoremap N Nzzzv
]])


-- Auto close brackets I don't like it '
-- inoremap ( ()<left>
-- inoremap [ []<left>
-- inoremap { {}<left>
-- inoremap " ""<left>
-- inoremap ' ''<left>

-- Auto Pairs
vim.cmd([[
inoremap {<CR> {<CR>}<ESC>0
inoremap {;<CR> {<CR>};<ESC>0
nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
]])


-- Nvim Comment
map("n", "<leader>c", ":CommentToggle<CR>", {}) -- Comment One Line
map("n", "<leader>p", "vip:CommentToggle<CR>", {}) -- Comment A Paragraph
map("x", "<leader>c", ":'<,'>CommentToggle<CR>", {}) -- Comment Multiple Lines In Visual Mode

-----------------
-- Visual Mode --
-----------------
-- Move Text Up And Down
vim.cmd([[
" move selected lines up one line
xnoremap <C-k>  :m-2<CR>gv=gv

" move selected lines down one line
xnoremap <C-j> :m'>+<CR>gv=gv
]])
