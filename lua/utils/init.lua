-- Utility functions (custom helpers, wrappers, etc.)

local M = {}

-- Get current file path (full)
function M.get_current_file()
    return vim.fn.expand('%:p')
end

-- Reload a Lua module
function M.reload(module)
    package.loaded[module] = nil
    return require(module)
end

-- Print table (debug)
function M.dump(tbl)
    print(vim.inspect(tbl))
end

-- Get project root (if using LSP or git)
function M.get_root()
    local util = require("lspconfig.util")
    local path = vim.fn.expand('%:p')
    return util.root_pattern(".git")(path) or vim.fn.getcwd()
end

-- Easy keymap setter
function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
