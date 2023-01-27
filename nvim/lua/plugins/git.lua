local utils = require("user.utils")

require('gitsigns').setup{
	on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
	 map('n', '<leader>gb', ':Gitsigns blame_line<CR>')
  end
}

--- 
--- local neogit = require('neogit')
--- neogit.setup({
	---disable_commit_confirmation = true,
	---disable_context_highlighting = false,
	---sections = {
	---	 untracked = {
	---		folded = false
	---	 },
	---	 unstaged = {
	---		folded = false
	---	 },
	---	 staged = {
	---		folded = false
	---	 },
	---	 stashes = {
	---		folded = true
	---	 },
	---	 unpulled = {
	---		folded = true
	---	 },
	---	 unmerged = {
	---		folded = false
	---	 },
	---	 recent = {
	---		folded = true
	---	 },
 --- }---,
 --- integrations = {
	---	diffview = true  
  ---},
---})
 ---utils.keymap("n", "<leader>gn", "<cmd>Neogit<CR>")

function runLazyGit()
	local Terminal = require('toggleterm.terminal').Terminal
	local run = Terminal:new({
		cmd = "lazygit",
		hidden = true,
		direction = "float",
		close_on_exit = true,
	})

	run:toggle()
end
utils.keymap("n", "<leader>gl", "<cmd>lua runLazyGit()<CR>")
