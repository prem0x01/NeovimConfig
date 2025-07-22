-- Advanced clipboard support using OSC52

return {
    {
        "ojroques/nvim-osc52",
        config = function()
            local osc52 = require("osc52")
            osc52.setup({
                max_length = 0,
                silent = false,
                trim = false,
                tmux_passthrough = true,
            })

            local function copy(lines, _)
                osc52.copy(table.concat(lines, '\n'))
            end

            local function paste()
                return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
            end

            vim.g.clipboard = {
                name = 'osc52',
                copy = { ['+'] = copy, ['*'] = copy },
                paste = { ['+'] = paste, ['*'] = paste },
            }

            local map = vim.keymap.set
            map('n', '<leader>cy', osc52.copy_operator, { expr = true, desc = "Copy using OSC52" })
            map('n', '<leader>cc', '<leader>cy_', { remap = true, desc = "Copy line using OSC52" })
            map('v', '<leader>cy', osc52.copy_visual, { desc = "Copy selection using OSC52" })
        end,
    },
}
