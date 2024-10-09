vim.api.nvim_create_user_command('Jython', require("jython").help, {})
vim.api.nvim_create_user_command('JR', require("jython").run_file, {})

-- Jython (help)
-- Jython run
-- Jython watch
-- Jython run_save_to_file (file_path)
