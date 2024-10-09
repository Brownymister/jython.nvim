---@class CustomModule
local M = {}

---@return string
M.my_first_function = function(greeting) return greeting .. " World!" end

---@return string
M.get_path_from_buffer = function() return vim.api.nvim_buf_get_name(0) end

---@param jython_path string
---@param split_interpreter boolean
M.run_file = function(jython_path, split_interpreter)
    local exec_file = M.get_path_from_buffer()
    if 
    vim.cmd(
        "echo 'Running file: " .. exec_file .. "' with Jython interpreter: " ..
            jython_path)
    vim.cmd("terminal ")
end

return M
