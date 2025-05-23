if (vim.g.vscode) then
	-- vscode extension
else
	require("config.lazy")
  require("config.remap")
end
