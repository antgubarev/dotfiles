local utils = {}

function utils.get_current_paragraph()
	local row, _ = unpack(vim.api.nvim_win_get_cursor(0))

	-- search forward
	local rowi = row
	while true do
		local lastLine = vim.api.nvim_buf_get_lines(0, rowi, rowi + 1, false) or { "" }
		if lastLine[1] == "" then
			break
		end
		if lastLine[1] == nil then
			break
		end
		rowi = rowi + 1
	end

	-- search back
	local rowj = row
	while true do
		local lastLine = vim.api.nvim_buf_get_lines(0, rowj, rowj + 1, false) or { "" }
		if lastLine[1] == "" then
			break
		end
		if lastLine[1] == nil then
			break
		end
		rowj = rowj - 1
		if rowj < 1 then
			break
		end
	end

	local lines = vim.api.nvim_buf_get_lines(0, rowj + 1, rowi, false)
	local result = table.concat(lines, " ")
	result = result:gsub("[%c]", "")

	return result
end

function utils.keymap(mode, lhs, rhs, desc)
	local opts = { noremap = true, silent = true, desc = desc }
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return utils
