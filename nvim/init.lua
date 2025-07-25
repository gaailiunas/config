local vim = vim
local Plug = vim.fn['plug#']

-- Start plugin management
vim.call('plug#begin')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.8'})
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/nvim-cmp')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('EdenEast/nightfox.nvim')
vim.call('plug#end')

-- Treesitter configuration
require("nvim-treesitter.configs").setup{
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

-- Set colorscheme
vim.cmd("colorscheme carbonfox")
vim.cmd("syntax on")
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

-- General settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.guicursor = "i:block-blinkwait1000-blinkon500-blinkoff500";
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1f1f1f" })

-- Indent Blankline setup
require("ibl").setup()

-- LuaLine setup
require('lualine').setup()
vim.opt.showmode = false

-- Nvim Tree setup
require("nvim-tree").setup()

-- LSP configuration for clangd
vim.diagnostic.config {
    virtual_text = false,
    float = {
        header = false,
        border = 'rounded',
        focusable = false,
    },
}

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local cmp = require("cmp")  -- Require cmp here

lspconfig.clangd.setup{
    capabilities = cmp_nvim_lsp.default_capabilities(),
    handlers = handlers,
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
    window =  {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})

-- NvimTree
vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeFocus<cr>', { desc = 'Focus NvimTree', noremap = true, silent = true })

-- LSP
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration', noremap = true, silent = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fc', vim.lsp.buf.format, { desc = 'Format code', noremap = true, silent = true })

-- Custom signature help with border
local function signature_help_with_border()
    vim.lsp.buf.signature_help({
        border = "rounded",
        focusable = false,
    })
end

vim.keymap.set({'i', 'v'}, '<C-s>', signature_help_with_border, { noremap = true, silent = true })

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics', noremap = true, silent = true })
vim.keymap.set('n', '<leader>r', vim.diagnostic.goto_next, { desc = 'Next diagnostic', noremap = true, silent = true })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Find files', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Live grep', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers', noremap = true, silent = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Help tags', noremap = true, silent = true })

