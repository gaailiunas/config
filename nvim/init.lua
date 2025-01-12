local vim = vim
local Plug = vim.fn['plug#']

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.call('plug#begin')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('tiagovla/tokyodark.nvim')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.8'})
Plug('neovim/nvim-lspconfig')
vim.call('plug#end')

require("nvim-treesitter.configs").setup{
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.cmd("colorscheme tokyodark")
vim.cmd("syntax on")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.opt.cursorline = true

require("nvim-tree").setup()
require("lspconfig").clangd.setup{}

vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeFocus<cr>', { desc = "Toggle Nvim Tree" })
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>fc', "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format code" })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
