local function _show_indent()
	vim.opt.list = true
	vim.opt.listchars = "eol:↲,tab:--,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣"
end

local function _hide_indent()
	vim.opt.list = false
	vim.opt.listchars = "eol:↲,tab:» ,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣"
end

vim.api.nvim_create_user_command("IndentShow", _show_indent, { desc = "ToggleIndent" })
vim.api.nvim_create_user_command("IndentHide", _hide_indent, { desc = "ToggleIndent" })
