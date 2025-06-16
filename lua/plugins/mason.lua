-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      -- add more things to the ensure_installed table protecting against community packs modifying it
      ensure_installed = {
        -- install language servers
        "ansible-language-server",
        "azure-pipelines-language-server",
        "bash-language-server",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "gopls",
        "helm-ls",
        "jq-lsp",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "pyright",
        -- "spectral-language-server",
        "vim-language-server",
        "yaml-language-server",

        -- install formatters
        "prettier",
        "prettierd",
        "shellcheck",
        "shfmt",
        "stylua",

        -- install debuggers
        "debugpy",
        "delve",

        -- install any other package
        "tree-sitter-cli",
        -- add more arguments for adding more language servers
      },
    },
  },
}
