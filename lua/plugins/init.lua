-- Lazy.nvim bootstrap and plugin loader

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Core LSP
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        priority = 1000,
    },

    -- Theming
    {
        "luisiacc/gruvbox-baby",
        priority = 1000,
        config = function()
            vim.cmd("colorscheme gruvbox-baby")
        end,
    },

    -- Plugin Modules
    { import = "plugins.telescope" },
    { import = "plugins.cmp" },
    { import = "plugins.lualine" },
    { import = "plugins.treesitter" },
    { import = "plugins.gitsigns" },
    { import = "plugins.markdown" },
    { import = "plugins.ui" },
    { import = "plugins.bufferline" },
    { import = "plugins.harpoon" },
    { import = "plugins.session" },
    { import = "plugins.autopairs" },
    { import = "plugins.formatting" },
    { import = "plugins.clipboard" },
    { import = "plugins.autosave" },
    { import = "plugins.diffview" },
    { import = "plugins.lspkind" },
    { import = "plugins.neoscroll" },
    { import = "plugins.nvimtree" },
    { import = "plugins.todo-comments" },
    { import = "plugins.mason" },


})
