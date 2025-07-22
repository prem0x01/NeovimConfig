-- Auto-close brackets and quotes using nvim-autopairs

return {
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
                ts_config = { java = false },
            })
        end,
    },
}
