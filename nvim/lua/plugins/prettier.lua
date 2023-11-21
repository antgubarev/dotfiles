local prettier = require("prettier")

prettier.setup({
    bin = "prettier", -- or `'prettierd'` (v0.23.3+)
    filetypes = {
        "graphql",
        "html",
        "json",
        "markdown",
        "yaml",
    },
    ["null-ls"] = {
        condition = function()
            return prettier.config_exists({
                -- if `false`, skips checking `package.json` for `"prettier"` key
                check_package_json = true,
            })
        end,
        runtime_condition = function(params)
            -- return false to skip running prettier
            return true
        end,
        timeout = 5000,
    },
})
