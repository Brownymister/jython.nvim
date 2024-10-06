---@class CustomModule
local M = {}

---@return string
M.my_first_function = function(greeting)
  return "hello, " + greeting
end

return M
