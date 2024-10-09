---@class CustomModule
local M = {}

---@return string
M.get_path_from_buffer = function() return vim.api.nvim_buf_get_name(0) end

---@return boolean
M.current_file_is_py = function() return vim.bo.filetype == "python" end

---@param jython_path string
---@param split_interpreter boolean
M.run_file = function(jython_path, split_interpreter)
    local exec_file = M.get_path_from_buffer()
    -- todo spliting execution window
    if split_interpreter then
        vim.cmd('split | terminal')
    else
        vim.cmd("terminal")
    end

    -- Wait for the terminal to be ready
    vim.defer_fn(function()
        -- Get the buffer number of the terminal
        local bufnr = vim.fn.bufnr('%')

        -- Send the command to the terminal
        vim.api.nvim_chan_send(vim.b[bufnr].terminal_job_id,
                               "Running file: " .. exec_file .. "\n")
        vim.api.nvim_chan_send(vim.b[bufnr].terminal_job_id, "java -jar " ..
                                   jython_path .. " " .. exec_file .. "\n")
        vim.cmd("startinsert")
    end, 100)
end

return M
