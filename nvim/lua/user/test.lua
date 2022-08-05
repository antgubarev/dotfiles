require("neotest").setup({
  adapters = {
	 require("neotest-go")({
      experimental = { 
        test_table = true,
      },
      args = { "-v", "-count=1", "-timeout=60s" }
    })
  },
})

local k = require("selfext.utils").keymap
k('n', '<leader>tt', ':lua require("neotest").run.run()<CR>')
k('n', '<leader>tf', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
k('n', '<leader>to', ':lua require("neotest").output.open({ short = false })<CR>')
k('n', '<leader>ts', ':lua require("neotest").summary.toggle()<CR>')
