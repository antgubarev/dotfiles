require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		"bash",
		"dockerfile",
		"glsl",
		"go",
		"hcl",
		"javascript",
		"json",
		"lua",
		"toml",
		"typescript",
		"vim",
		"yaml",
		"python",
		"sql"
	},

  -- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = true,

	highlight = {
		 enable = true,
		 additional_vim_regex_highlighting = false,
	},
}

