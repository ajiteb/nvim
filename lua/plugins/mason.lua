-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      -- add more things to the ensure_installed table protecting against community packs modifying it
      ensure_installed = {
        "ansiblels",
        "azure_pipelines_ls",
        "bashls",
        "dockerls",
        "gopls",
        "helm_ls",
        "jqls",
        "jsonls",
        "lua_ls",
        "marksman",
        "pyright",
        "spectral",
        "vimls",
        "yamlls",
        -- add more arguments for adding more language servers
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      -- add more things to the ensure_installed table protecting against community packs modifying it
      ensure_installed = {
        "prettier",
        "prettierd",
        "shellcheck",
        "shfmt",
        "stylua",
        -- add more arguments for adding more null-ls sources
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- add more things to the ensure_installed table protecting against community packs modifying it
      ensure_installed = {
        "delve",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
