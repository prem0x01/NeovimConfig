-- UI enhancements and developer experience

return {
    { "folke/which-key.nvim",   config = function() require("which-key").setup({}) end },
    { "stevearc/dressing.nvim", config = function() require("dressing").setup({}) end },
    { "folke/zen-mode.nvim",    config = function() require("zen-mode").setup() end },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({
                position = "bottom",
                height = 12,
                use_diagnostic_signs = true
            })
            vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Toggle Trouble" })
        end,
    },

    {
        "goolord/alpha-nvim",
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                " ██████╗ ██████╗ ███████╗███╗   ███╗ ",
                " ██╔══██╗██╔══██╗██╔════╝████╗ ████║ ",
                " ██████╔╝██████╔╝█████╗  ██╔████╔██║ ",
                " ██╔═══╝ ██╔══██╗██╔══╝  ██║╚██╔╝██║ ",
                " ██║     ██║  ██║███████╗██║ ╚═╝ ██║ ",
                " ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ ",
                "                                     ",
                "        [ 🐺️  prem0x01 🐺️ ]          ",
            }
            dashboard.section.buttons.val = {
                dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
                dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
                dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
                dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
                dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
            }
            alpha.setup(dashboard.opts)
        end,
    },

    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]],
                direction = "float",
                float_opts = { border = "curved" },
            })
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help", "alpha", "dashboard", "neo-tree", "Trouble",
                    "lazy", "mason", "notify", "toggleterm", "lazyterm",
                },
            },
        },
    },

    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" }, {
                RGB = true,
                RRGGBB = true,
                names = true,
                css = true,
            })
        end,
    },

    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
            require("notify").setup({
                background_colour = "#000000",
                fps = 30,
                level = 2,
                minimum_width = 50,
                render = "compact",
                stages = "fade_in_slide_out",
                timeout = 2000,
                top_down = true
            })
        end,
    },
}
