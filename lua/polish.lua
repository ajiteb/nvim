--- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
local function yaml_ft(path, bufnr)
  -- get content of buffer as string
  local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  if type(content) == "table" then content = table.concat(content, "\n") end

  -- check if file is in roles, tasks, or handlers folder
  local path_regex = vim.regex "(tasks\\|roles\\|handlers)/"
  if path_regex and path_regex:match_str(path) then return "yaml.ansible" end
  -- check for known ansible playbook text and if found, return yaml.ansible
  --- local regex = vim.regex "hosts:\\|tasks:"
  local regex = vim.regex "ansible.builtin.\\|tasks:"
  if regex and regex:match_str(content) then return "yaml.ansible" end

  regex = vim.regex "pool:\\|stages:\\|stage:\\|steps:"
  if regex and regex:match_str(content) then return "yaml.azure" end

  -- return yaml if nothing else
  return "yaml"
end
-- Set up custom filetypes
vim.filetype.add {
  extension = {
    yml = yaml_ft,
    yaml = yaml_ft,
  },
}
