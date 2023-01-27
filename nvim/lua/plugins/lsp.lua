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

-- require('lspconfig')['sqlls'].setup {
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- 	cmd = {"sql-language-server", "up", "--method", "stdio"}
-- }

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
})

local runtime_path = vim.split(package.path, ";", {})
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require("lspconfig")["sumneko_lua"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			completion = {
				callSnippet = "Replace",
			},
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
			hint = {
				enable = true,
			},
		},
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.fish_indent,
	},
	capabilities = capabilities,
	on_attach = on_attach,
})

require("neodev").setup()

vim.api.nvim_set_var("go_def_mode", "gopls")
vim.api.nvim_set_var("go_info_mode", "gopls")
