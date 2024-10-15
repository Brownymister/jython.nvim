vim.api.nvim_create_user_command('Jython', require("jython").help, {})
vim.api.nvim_create_user_command('JR', require("jython").run_file, {})
vim.api.nvim_create_user_command('JRSplit', require("jython").run_file_split, {})

-- TODO: Subcommands

-- Jython (help)
-- Jython run
-- Jython watch
-- Jython run_save_to_file (file_path)
