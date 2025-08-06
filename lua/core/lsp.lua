vim.defer_fn(function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local map = vim.keymap.set

    local border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
    }

    -- Apply border to LSP handlers
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = border }
    )
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = border }
    )

    -- Configure signs (apply before diagnostics)
    local signs = {
        Error = "✘",
        Warn  = "▲",
        Hint  = "💡",
        Info  = "",
    }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Diagnostic UI behavior
    vim.diagnostic.config({
        virtual_text = {
            prefix = "●",
            source = "if_many",
            spacing = 2,
        },
        signs = true,
        update_in_insert = true,
        severity_sort = true,
        underline = true,
        float = {
            border = border,
            source = "always",
            header = "⚠️ Diagnostics",
            max_width = 80,
            max_height = 10,
            format = function(d)
                return string.format("%s [%s]", d.message, d.source)
            end,
        },
    })

    -- Show float only when hovering, and hide on move
    vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
            vim.diagnostic.open_float(nil, {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = border,
                source = "always",
                prefix = " ",
                scope = "cursor",
            })
        end,
    })

    vim.o.updatetime = 250 -- required for CursorHold to trigger quickly

    -- Attach function for LSP clients
    local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    end

    -- Base LSP servers
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                telemetry = { enable = false },
            },
        },
    })

    lspconfig.gopls.setup({ capabilities = capabilities, on_attach = on_attach })
    lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach })

    -- Optional: Setup mason-managed servers only if installed
    local function setup_if_available(name)
        local ok, mason = pcall(require, "mason-lspconfig")
        if ok and vim.tbl_contains(mason.get_installed_servers(), name) then
            lspconfig[name].setup({ capabilities = capabilities, on_attach = on_attach })
        end
    end

    setup_if_available("html")
    setup_if_available("cssls")
    setup_if_available("emmet_ls")
end, 0)
