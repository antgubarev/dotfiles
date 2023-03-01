local utils = require("user.utils")

function _G.ExecCurl()
	local command = utils.get_current_paragraph()
	vim.cmd("tabnew | r ! " .. command)
end
--
utils.keymap("n", "<S-e>", "<cmd>lua ExecCurl()<CR>")
vim.api.nvim_create_user_command("ExecCurl", ExecCurl, { desc = "exec curl in the cursor position" })
