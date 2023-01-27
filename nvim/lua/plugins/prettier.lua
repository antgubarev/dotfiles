local prettier = require("prettier")

prettier.setup({
	bin = "prettier",
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"less",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
		"json",
	},
})
