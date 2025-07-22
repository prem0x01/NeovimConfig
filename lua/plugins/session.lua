-- Auto-session management plugin

return {
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
                auto_session_use_git_branch = false,
                auto_restore_enabled = true,
                auto_save_enabled = true,
                pre_save_cmds = { "NvimTreeClose" },
                post_restore_cmds = { "NvimTreeOpen" },
            })
        end,
    },
}
