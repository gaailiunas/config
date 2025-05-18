local vim = vim
local Plug = vim.fn['plug#']

-- Start plugin management
vim.call('plug#begin')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('nvim-tree/nvim-web-devicons')
Plug('tiagovla/tokyodark.nvim')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.8'})
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/nvim-cmp')
vim.call('plug#end')

-- Treesitter configuration
require("nvim-treesitter.configs").setup{
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- Set colorscheme
vim.cmd("colorscheme tokyodark")
vim.cmd("syntax on")

-- General settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.cursorline = true

-- Nvim Tree setup
require("nvim-tree").setup()

-- LSP configuration for clangd
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local cmp = require("cmp")  -- Require cmp here

lspconfig.clangd.setup{
    capabilities = cmp_nvim_lsp.default_capabilities(),
}
lspconfig.rust_analyzer.setup{

}

-- nvim-cmp setup
cmp.setup({
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),  -- Trigger completion
        ['<CR>'] = cmp.mapping.confirm({ select = true }),  -- Confirm selection
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item()
    },
    sources = {
        { name = 'nvim_lsp' },  -- Add nvim_lsp source for LSP completions
        { name = 'buffer' },     -- Buffer source for completions from open buffers
    },
    experimental = {
        ghost_text = true,
    },
})

-- NvimTree
vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeFocus<cr>', { desc = 'Focus NvimTree', noremap = true, silent = true })

-- LSP
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration', noremap = true, silent = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fc', vim.lsp.buf.format, { desc = 'Format code', noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help, { desc = 'Signature help', noremap = true, silent = true })

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics', noremap = true, silent = true })
vim.keymap.set('n', '<leader>r', vim.diagnostic.goto_next, { desc = 'Next diagnostic', noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Find files', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Live grep', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Help tags', noremap = true, silent = true })
