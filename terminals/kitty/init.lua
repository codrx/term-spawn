
local M = {}

--[[

 Example Launch Command:

    kitten @ lauch --allow-remote-control --type=os-window --no-response --title Output

 Example Pipe Command:
    
    ls | kitten @ send-text --match id:3 --stdin

--]]


-- https://sw.kovidgoyal.net/kitty/remote-control/#kitten-launch
M.args = {
  spawn = {
    main_command = "kitten @ launch --allow-remote-control",
    response = {                                              -- Don't print window id number 
      arg = "--no-response"
    },
    -- title = "--title ",
    focus_current = {                                         -- Keep focus on current window
      arg = "--keep-focus"
    },
    hold = {                                                  -- Keep window open after window exits??
      arg = "--hold"
    },
    window = {
      arg = "--type=",
      os_window = "os-window",                                -- Faster than window (in my experience)
      window = "window",                                      -- Slower than os-window (in my experience)
      tab = "tab",
      overlay = "overlay",                                    -- Open above current window
      -- background = "background"
    },
    location = {
      arg = "--location",                                     -- Where window opens
      options = {
        default = "default",
        after = "after",
        before = "before",
        first = "first",
        last = "last",
        hsplit = "hsplit",
        vsplit = "vsplit",
        split = "split"
      }
    },
    cwd = {
      arg = "--cwd",                                          -- Which dir to open window in
      default = "current"
    }
  },

  pipe = "kitten @ send-text --match "
}

local commands = {}


M.commands = commands

-- "~/.config/nvim/init.vim"

-- vim.cmd [[
--   map <silent> <leader>oft :echo expand("<cfile>")<CR>
-- ]]


M.mappings = {
  i = {},
  n = {
    ["<leader>oft"] = "",
  }
}

M.window_tracker = {

}


-- create a callback for pipe because we need window id number to send text

---@param id integer
---@param extra_commands string
---@param input string
M.pipe_to_term = function(id, extra_commands, input)
  local command = M.commands.pipe
  local command_id = command.."id:"..id
end

return M
