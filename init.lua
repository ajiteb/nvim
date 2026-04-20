-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- Move between buffers
vim.api.nvim_set_keymap("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })

-----------------------------------------------------------
-- Copilot (Ctrl-based, CORRECT expr usage)
-----------------------------------------------------------

-- Disable Copilot default <Tab>
vim.g.copilot_no_tab_map = true

-- Accept Copilot suggestion
vim.keymap.set("i", "<C-g>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  silent = true,
  replace_keycodes = false,
  desc = "Copilot Accept",
})

-- Next / Previous suggestions
vim.keymap.set("i", "<C-f>", "<Plug>(copilot-next)", { silent = true })
vim.keymap.set("i", "<C-d>", "<Plug>(copilot-previous)", { silent = true })

-- Dismiss suggestion
vim.keymap.set("i", "<C-x>", "<Plug>(copilot-dismiss)", { silent = true })

-- Toggle Copilot
vim.keymap.set("n", "<Space>tc", ":Copilot toggle<CR>", {
  desc = "Toggle Copilot",
})

-----------------------------------------------------------
-- Copilot ghost text appearance
-----------------------------------------------------------

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "CopilotSuggestion", {
      fg = "#6c7086",
      italic = true,
    })
    vim.api.nvim_set_hl(0, "CopilotAnnotation", {
      fg = "#89b4fa",
      italic = true,
    })
  end,
})

require "lazy_setup"
require "polish"
