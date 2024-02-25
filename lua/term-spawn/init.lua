local M = {}

--[[ 

   Goal of extension:

      Spawn a file in a new terminal window

   Future features:

      -  Pipe command from current window into another window

--]]



local default_commands = {
  spawn = {
    command = nil,
    {
      name = nil
    },
  },
  pipe = { }
}

local window_tracker = {
  track = nil,
  value = {}
}


-- "~/.config/nvim/init.vim"

local function oft(file_path)
  print(file_path)
end

vim.cmd [[
  map <silent> <leader>oft :echo expand("<cfile>")<CR>
]]



---@param commands table: Table of executable commands 
M.assign_keybindings = function(commands)
  print(table.unpack(commands))
end


---@param term string: Terminal name
M.setup = function(term)
  local term_commands = require("termSpawn."..term).commands
  local new_commands = vim.tbl_deep_extend("keep", default_commands, term_commands or {})
  M.assign_keybindings(new_commands)
end

return M
