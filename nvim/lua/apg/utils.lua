local utils = {}

function utils.getCurrentParagraph()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local linesTable = vim.api.nvim_buf_get_lines(0, row-1, vim.api.nvim_buf_line_count(0), false) or {""}
	local lines = ""
	for k,v in pairs(linesTable) do
		if v == "" then
			lines = vim.api.nvim_buf_get_lines(0, row-1, row+k-1, false)
			break
		end
	end

	local result = table.concat(lines, " ")
	return result:gsub('[%c]', '')
end

function utils.keymap(mode, lhs, rhs)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return utils
