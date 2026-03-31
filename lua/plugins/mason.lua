-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
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
      },
    },
  },
}
