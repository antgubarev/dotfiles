local autosave = require("autosave")

autosave.setup({
	events = { "BufLeave" },
})
