vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.swapfile = false
vim.g.mapleader = " "

local map = vim.keymap.set

-- Key Mappings
map('n', '<leader>R', ':update<CR> :source<CR>', { desc = 'Reload nvim' })
map('n', '<C-s>', ':write<CR>', { desc = 'Save File' })
map('n', '<leader>q', ':quit<CR>', { desc = 'Quit nvim' })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Format' })


-- Plugin Setup
-- NOTE: Using 'vim.pack.add' is the built-in package loader.
-- For a standard Neovim setup without a dedicated plugin manager (like Packer, Lazy, or others),
-- this is the correct way to specify plugins if they are manually placed in 'pack/*/start/'.
-- However, if you are relying on a manager, the structure would change.
-- Since the original code used 'vim.pack.add', I'll wrap the list in a function call
-- but keep the original logic for simplicity and compatibility with a 'packages' workflow.

vim.pack.add({
    { src = "https://github.com/catppuccin/nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs", event = "InsertEnter" },

    -- noice
    {
        src = "https://github.com/folke/noice.nvim",
        event = "VimEnter",
    },

    -- noice dependencies
    { src = "https://github.com/MunifTanjim/nui.nvim"},
    { src = "https://github.com/rcarriga/nvim-notify" },
})


-- Plugin Configurations
require("mason").setup({
    ui = {
        border = "rounded",
    },
})

require("nvim-autopairs").setup({})


require("noice").setup({})


-- Theme and LSP
vim.cmd("colorscheme catppuccin")
vim.cmd(":hi statusline guibg=NONE")

vim.lsp.enable({ "lua_ls" })
