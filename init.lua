if vim.g.vscode then
  -- VSCode Neovim
  require ("config.vscode_config")
else
  -- Ordinary Neovim
  require("config")
end
