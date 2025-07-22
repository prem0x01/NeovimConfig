-- LSP configuration and diagnostics

vim.defer_fn(function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local map = vim.keymap.set

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

        vim.diagnostic.config({
            virtual_text = { prefix = "●", source = "if_many", spacing = 2 },
            signs = { priority = 10 },
            update_in_insert = true,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always",
                header = "💀",
                max_width = 80,
                max_height = 10,
                format = function(d) return string.format("%s [%s]", d.message, d.source) end,
            },
        })
    end

    -- Basic servers
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

    -- Optional servers if installed with mason
    local function setup_if_available(name)
        if require("mason-lspconfig").get_available_servers()[name] then
            lspconfig[name].setup({ capabilities = capabilities, on_attach = on_attach })
        end
    end

    setup_if_available("html")
    setup_if_available("cssls")
    setup_if_available("emmet_ls")
end, 0)
