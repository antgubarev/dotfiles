local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", opts)
    buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "<leader>lr", "<cmd>LspRestart<CR>", opts)
    buf_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next({ float = false })<CR>", opts)
    buf_set_keymap("n", "<leader>dN", "<cmd>lua vim.diagnostic.goto_prev({ float = false })<CR>", opts)

    -- Auto formatting
    if client.server_capabilities.documentFormattingProvider and client.name ~= "sumneko_lua" then
        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({
                    filter = function(cli)
                        return cli.name == client.name
                    end,
                })
            end,
            group = group,
        })
    end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig")["gopls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        gopls = {
            buildFlags = { "-tags=integration" },
            gofumpt = true,
            codelenses = {
                gc_details = true,
                generate = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            analyses = {
                nilness = true,
                unusedparams = true,
                unusedvariable = true,
                unusedwrite = true,
                useany = true,
            },
            staticcheck = true,
            directoryFilters = { "-.git", "-node_modules" },
            semanticTokens = true,
        },
    },
})

require("lspconfig")["pyright"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        python = {
            venvPath = "/Users/antgubarev/Library/Caches/pypoetry/virtualenvs",
        },
    },
})

require("lspconfig")["bashls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

local runtime_path = vim.split(package.path, ";", {})
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require("lspconfig")["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    ".undodir",
                },
            },
            telemetry = { enable = false },
            completion = {
                callSnippet = "Replace",
            },
            hint = {
                enable = true,
            },
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

require("lspconfig")["yamlls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        yaml = {
            schemaStore = {
                url = "https://www.schemastore.org/api/json/catalog.json",
                enable = true,
            },
        },
    },
})

require("lspconfig")["jsonls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
    init_options = {
        provideFormatter = false, -- i use prettier
    },
})

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.fish_indent,
        null_ls.builtins.formatting.prettier,
    },
    capabilities = capabilities,
    on_attach = on_attach,
})

require("neodev").setup()
