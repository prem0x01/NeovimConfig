return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      debounce_delay = 135, -- ✅ this prevents the nil error
      execution_message = {
        message = function() return "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S") end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { "InsertLeave", "TextChanged" },
      conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true, -- ✅ important to avoid nil comparison
      },
      write_all_buffers = false,
      on_off_commands = true,
      clean_command_line_interval = 0,
    })
  end,
}

