-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- add more things to the ensure_installed table protecting against community packs modifying it
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
