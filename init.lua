-- Vim Config 
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4");
vim.g.mapleader = " "

vim.keymap.set('n', '<C-s>', ':w<CR>', {})

-- Setup Lazy (Package Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- List of options
local opts = {}

-- Lazy (Package Manager)
require("lazy").setup("plugins")


-- Neo Tree (File Tree Navigator)
vim.keymap.set('n', "<C-b>", ':Neotree filesystem reveal left<CR>')

-- Treesitter (Language Parser)
local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "typescript", "javascript", "json", "c_sharp", "css" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },  
})


-- Hard mode
local hardmode = true
if hardmode then
    -- Show an error message if a disabled key is pressed
    local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

    -- Disable arrow keys in insert mode with a styled message
    vim.api.nvim_set_keymap('i', '<Up>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Down>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Left>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Right>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Del>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<BS>', '<C-o>' .. msg, { noremap = true, silent = false })

    -- Disable arrow keys in normal mode with a styled message
    vim.api.nvim_set_keymap('n', '<Up>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Down>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Left>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Right>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<BS>', msg, { noremap = true, silent = false })
end
