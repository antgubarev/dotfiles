local k = require("user.utils").keymap
local ts_utils = require("nvim-treesitter.ts_utils")

local function _get_parent_gostruct_name()
	local node = ts_utils.get_node_at_cursor()
	while node do
		if node:type() == "struct_type" then
			break
		end
		local prev = ts_utils.get_previous_node(node, false, false)
		if prev == nil then
			node = node:parent()
		else
			node = prev
		end
	end
	if node == nil then
		return nil
	end

	local structNameNode = ts_utils.get_previous_node(node, false, false)

	return vim.treesitter.get_node_text(structNameNode, 0)
end

local function _get_current_filename()
	return vim.fn.expand("%:p")
end

local function _modifytags_get_struct_name()
	local structName = _get_parent_gostruct_name()
	if structName == nil then
		error("struct not found. place the cursor inside struct")
	end

	return structName
end

local function _modifytags_get_tagname(args)
	local tag = args.fargs[1]
	if tag == nil then
		error("it needs to enter a tag")
		return
	end

	return tag
end

local function _modifytags_add_tags(args)
	local structName = _modifytags_get_struct_name()
	local tag = _modifytags_get_tagname(args)
	local fn = _get_current_filename()
	local cmd = ":! gomodifytags -w -file " .. fn .. " -struct " .. structName .. " -add-tags " .. tag
	vim.api.nvim_exec(cmd, true)
end

local function _modifytags_remove_tags(args)
	local structName = _modifytags_get_struct_name()
	local tag = _modifytags_get_tagname(args)
	local fn = _get_current_filename()
	local cmd = ":! gomodifytags -w -file " .. fn .. " -struct " .. structName .. " -remove-tags " .. tag
	vim.api.nvim_exec(cmd, true)
end

vim.api.nvim_create_user_command("GoTagAdd", _modifytags_add_tags, { desc = "gomodifytags add tags", nargs = 1 })
vim.api.nvim_create_user_command(
	"GoTagRemove",
	_modifytags_remove_tags,
	{ desc = "gomodifytags remove tags", nargs = 1 }
)

local function restart(name)
	local configs = require("lspconfig.configs")
	local bufnr = vim.api.nvim_get_current_buf()
	for _, client in
		ipairs(vim.lsp.get_active_clients({
			bufnr = bufnr,
			name = name,
		}))
	do
		print("Restarting " .. client.name .. "...")
		client.stop()
		vim.defer_fn(function()
			configs[client.name].launch()
		end, 500)
	end
end

local function tidy()
	print("Running `go mod tidy`...")
	local uv = vim.loop
	local stdout = uv.new_pipe(false)
	local stderr = uv.new_pipe(false)

	local function on_read(err, _)
		assert(not err, err)
	end

	local function on_error(err, data)
		assert(not err, err)
		if data then
			print(data)
		end
	end

	handle, _ = uv.spawn(
		"go",
		{
			args = { "mod", "tidy" },
			stdio = { nil, stdout, stderr },
		},
		vim.schedule_wrap(function()
			stdout:read_stop()
			stderr:read_stop()
			stdout:close()
			stderr:close()
			handle:close()
			vim.schedule(function()
				for _, name in ipairs({ "gopls" }) do
					restart(name)
				end
			end)
		end)
	)

	uv.read_start(stdout, on_read)
	uv.read_start(stderr, on_error)
	uv.run("once")
end

vim.api.nvim_create_user_command("GoModTidy", tidy, vim.tbl_extend("force", { desc = "go mod tidy" }, {}))
k("n", "<leader>gmt", ":GoModTidy<CR>", "Run go mod tidy")
