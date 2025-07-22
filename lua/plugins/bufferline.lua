return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                numbers = "none",
                close_command = "bdelete! %d",       -- Close with X
                right_mouse_command = "bdelete! %d", -- Right-click close
                indicator = {
                    style = "icon",
                    icon = "|",
                },
                buffer_close_icon = "", -- <- fancy X icon (nf-fa-close)
                modified_icon = "●",
                close_icon = "",
                show_close_icon = true,
                show_buffer_close_icons = true,
                max_name_length = 18,
                max_prefix_length = 15,
                tab_size = 20,
                diagnostics = false,
                always_show_bufferline = true,
            },
        })
    end,
}
