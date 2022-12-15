local k = require("selfext.utils").keymap

--- NeoScroll
require('neoscroll').setup()

local t = {}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
t['zt']    = {'zt', {'250'}}
t['zz']    = {'zz', {'250'}}
t['zb']    = {'zb', {'250'}}

require('neoscroll.config').set_mappings(t)

--- NvimTree
require'nvim-tree'.setup{
	actions = {
      open_file = {
      	quit_on_open = true,
      },
	},
	view = {
		side = 'right',
		width = 90,
	},
}

k("n", "<leader>vv", ":NvimTreeToggle<CR>")
k("n", "<leader>tf", ":NvimTreeFindFile<CR>")

--- Hop
-- require('hop').setup({})
--
-- 
-- k("n", "hl", ":HopLine<CR>")
-- k("n", "hp", ":HopPattern<CR>")
-- k("n", "hw", ":HopWordCurrentLine<CR>")
