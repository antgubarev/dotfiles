local ok, bufline = pcall(require, "bufferline")

bufline.setup({
	options = {
		diagnostics = "nvim_lsp",
        show_tab_indicators = true,
	},
})

