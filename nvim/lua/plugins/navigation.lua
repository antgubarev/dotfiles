local k = require("user.utils").keymap

--- NeoScroll
require("neoscroll").setup()

local t = {}
t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
t["zt"] = { "zt", { "250" } }
t["zz"] = { "zz", { "250" } }
t["zb"] = { "zb", { "250" } }

require("neoscroll.config").set_mappings(t)

--- NvimTree
-- require("nvim-tree").setup({
-- 	actions = {
-- 		open_file = {
-- 			quit_on_open = true,
-- 		},
-- 	},
-- 	view = {
-- 		float = {
-- 			enable = true,
-- 			open_win_config = {
-- 				relative = "editor",
-- 				border = "rounded",
-- 				width = 90,
-- 				height = 130,
-- 				row = 100,
-- 				col = 200,
-- 			},
-- 		},
-- 	},
-- })

-- k("n", "<leader>vv", ":NvimTreeToggle<CR>")

require("which-key").setup({})

--- Hop
-- require('hop').setup({})
--
--
-- k("n", "hl", ":HopLine<CR>")
-- k("n", "hp", ":HopPattern<CR>")
-- k("n", "hw", ":HopWordCurrentLine<CR>")
