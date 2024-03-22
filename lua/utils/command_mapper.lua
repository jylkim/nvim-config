local command_mapper = function(name, command, opts)
  local options = { bang = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_create_user_command(name, command, options)
end

return { user_command = command_mapper }
