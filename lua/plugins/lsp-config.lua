return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "elixirls",
          "rust_analyzer",
          "cssls",
          "html",
          "zls",
        }
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- setup LSPs
      lspconfig.lua_ls.setup({})
      lspconfig.rust_analyzer.setup({})
      lspconfig.elixirls.setup({})
      lspconfig.cssls.setup({})
      lspconfig.html.setup({})
      lspconfig.gleam.setup({})
      lspconfig.zls.setup({})

      -- keymaps
      local buf = vim.lsp.buf
      local opts = {}
      vim.keymap.set("n","K", buf.hover, opts)
      vim.keymap.set("n", "gD", buf.declaration, opts)
      vim.keymap.set("n", "gd", buf.definition, opts)
      vim.keymap.set("n", "gi", buf.implementation, opts)
      vim.keymap.set("n", "<leader>ca", buf.code_action, opts)
    end
  }
}
