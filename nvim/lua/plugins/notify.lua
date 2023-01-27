local notify = require("notify")
notify.setup({
	render = "minimal",
	stages = "static",
	timeout = 3000,
	max_height = function()
		return math.floor(vim.o.lines * 0.5)
	end,
	max_width = function()
		return math.floor(vim.o.columns * 0.5)
	end,
	on_open = function(win)
		vim.api.nvim_win_set_config(win, { focusable = false })
	end,
})
vim.notify = notify

vim.keymap.set("n", "<leader>un", function()
	notify.dismiss({ silent = true, pending = true })
end, {
	noremap = true,
	silent = true,
	desc = "Delete all Notifications",
})
