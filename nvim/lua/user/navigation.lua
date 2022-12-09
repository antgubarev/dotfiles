require('neoscroll').setup()

local t = {}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
t['zt']    = {'zt', {'250'}}
t['zz']    = {'zz', {'250'}}
t['zb']    = {'zb', {'250'}}

require('neoscroll.config').set_mappings(t)

require('hop').setup({})

local k = require("selfext.utils").keymap
k("n", "hl", ":HopLine<CR>")
k("n", "hp", ":HopPattern<CR>")
k("n", "hw", ":HopWordCurrentLine<CR>")
