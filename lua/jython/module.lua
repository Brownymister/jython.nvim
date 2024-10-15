---@class CustomModule
local M = {}

---@return string
--- not implemented yet
M.help = function()
    return
        "Jython (help)\nJython run\nJython watch\nJython run_save_to_file (file_path)"
end

---@return string
M.get_path_from_buffer = function() return vim.api.nvim_buf_get_name(0) end

---@return boolean
M.current_file_is_py = function() return vim.bo.filetype == "python" end

---@param jython_path string
---@param split_interpreter boolean
M.run_file = function(jython_path, split_interpreter)
    local exec_file = M.get_path_from_buffer()
    if not M.current_file_is_py() then
        print("Current file is not a python file")
        return
    end

    if split_interpreter then
        vim.cmd('split | terminal')
    else
        vim.cmd("tabnew | terminal")
    end

    local cmd = "java -jar " .. jython_path .. " " .. exec_file .. "\n"

    vim.defer_fn(function()
        -- Get the buffer number of the terminal
        local bufnr = vim.fn.bufnr('%')

        -- Send the command to the terminal
        vim.api.nvim_chan_send(vim.b[bufnr].terminal_job_id, cmd)
    end, 100)
end

M.append_line_to_log_file = function(file_path, line)
    local out = io.open(file_path, 'r')

    local lines = {}
    for line in f:lines() do table.insert(lines, line) end

    -- Close the file so that we can open it in a different mode
    out:close()

    -- Insert what we want to write to the first line into the table
    table.insert(lines, 1, line .. "\n")

    -- Open temporary file in w mode (write data)
    -- Iterate through the lines table and write each line to the file
    local out = io.open(file_path .. ".temp", 'w')
    for _, line in ipairs(lines) do out:write(line) end
    out:close()

    -- At this point, we should have successfully written the data to the temporary file

    -- Delete the old file
    os.remove(file_path)

    -- Rename the new file
    os.rename(file_path .. ".temp", file_path)
end

return M
