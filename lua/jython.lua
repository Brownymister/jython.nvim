-- main module file
local module = require("jython.module")

---@class Config
---@field opt string Your config option
local config = {
    jython_path = "~/dev/jython/jython.jar",
    split_interpreter = false
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
    M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.help = function() module.help() end

M.run_file = function() module.run_file(M.config.jython_path, M.config.split_interpreter) end

return M

