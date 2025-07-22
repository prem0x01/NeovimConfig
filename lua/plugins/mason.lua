-- Handles installation of LSP servers

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "pyright",
          "html",
          "cssls",
          "emmet_ls",
        },
        automatic_installation = true,
      })
    end,
  },
}

