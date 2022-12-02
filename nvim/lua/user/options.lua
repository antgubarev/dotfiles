local options = {
	tabstop = 3,
	shiftwidth = 3,
	softtabstop = 3,
	number = true,
	relativenumber = true,
	cursorline = true,
	completeopt = { "menu", "menuone", "noselect", "noinsert" },
	encoding = "utf-8",
	signcolumn = "yes",
	swapfile = false,
	autoindent = true,
	smartindent = true,
	scrolloff = 15,
	undofile = true,
	undodir = os.getenv("HOME") .. "/.config/nvim/undodir",
	ignorecase = true,
	incsearch = true,
	ruler = true,
	wildmenu = true,
	colorcolumn = "120",
	foldmethod = "indent",
	foldnestmax = 3,
	foldminlines = 10,
	foldlevelstart = 999,
	backspace = { "indent", "eol", "start" },
	laststatus = 3,
	list = true,
	listchars = "eol:↲,tab:» ,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣",
	langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd([[
	set termguicolors
	lan en_US.UTF-8
	colorscheme vscode
]])
