require("nvim-treesitter.configs").setup({
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
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "hcl",
        "javascript",
        "jq",
        "json",
        "lua",
        "make",
        "markdown",
        "toml",
        "typescript",
        "vim",
        "yaml",
        "python",
        "sql",
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
    },
})
