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

	sync_install = true,

	highlight = {
		 enable = true,
		 additional_vim_regex_highlighting = false,
	},

	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",

				["ap"] = "@parameter.outer",
				["ip"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
			},
		 },
	}
}
