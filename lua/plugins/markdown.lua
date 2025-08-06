-- Markdown enhancements: preview, tables, TOC, etc.

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "markdown",
                "markdown_inline",
            },
        },
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        config = function()
            vim.g.mkdp_auto_start = 0
            vim.g.mkdp_auto_close = 1
            vim.g.mkdp_theme = "dark"
        end,
    },

    {
        "preservim/vim-markdown",
        ft = { "markdown" },
        dependencies = { "godlygeek/tabular" },
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_math = 1
            vim.g.vim_markdown_frontmatter = 1
            vim.g.vim_markdown_conceal = 2
            vim.g.vim_markdown_conceal_code_blocks = 1
        end,
    },

    {
        "dhruvasagar/vim-table-mode",
        ft = { "markdown" },
        config = function()
            vim.g.table_mode_corner = '|'
        end,
    },

    {
        "mzlogin/vim-markdown-toc",
        ft = { "markdown" },
        config = function()
            vim.g.vmt_auto_update_on_save = 1
        end,
    },

    {
        "ellisonleao/glow.nvim",
        cmd = "Glow",
        ft = { "markdown" },
        config = function()
            require("glow").setup({ style = "dark" })
        end,
    },

    {
        "akinsho/org-bullets.nvim",
        ft = { "markdown" },
        config = function()
            require("org-bullets").setup({
                concealcursor = false,
                symbols = {
                    headlines = { "◉", "○", "✸", "✿" },
                    checkboxes = {
                        half = { "", "OrgTSCheckboxHalfChecked" },
                        done = { "✓", "OrgDone" },
                        todo = { "", "OrgTODO" },
                    },
                },
            })
        end,
    },
}
