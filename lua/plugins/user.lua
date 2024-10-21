-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     style = "moon",
  --   },
  -- },
  {
    "nvchad/ui",
    opts = {
      base46 = { theme = "dark_horizon", style = "bordered" },
    },
  },
}
