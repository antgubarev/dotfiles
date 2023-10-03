-- trim whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.cmd([[
         keeppatterns %s/\s\+$//e
      ]])
    end,
    group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
})

-- filetypes
local ftGroup = vim.api.nvim_create_augroup("filetype_group", { clear = false })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*/sites-enabled/*.conf",
    command = "set filetype=nginx",
    group = ftGroup,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.tsx", "*.jsx" },
    command = "set filetype=typescriptreact",
    group = ftGroup,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.brief" },
    command = "set filetype=brief",
    group = ftGroup,
})

-- disable search hilight in insert mode
local hiGroup = vim.api.nvim_create_augroup("highlight_group", { clear = false })
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    group = hiGroup,
    command = "setlocal nohlsearch",
})

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    group = hiGroup,
    command = "setlocal hlsearch",
})

local formatGroup = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
--- vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = vim.api.nvim_get_current_buf(),
    group = formatGroup,
    callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
    end,
    desc = "[lsp] format on save",
})

-- switch to absolute line numbers in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
        vim.opt.relativenumber = false
        vim.opt.cursorline = false
    end,
})

-- switch to relative line numbers in normal mode
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        vim.opt.relativenumber = true
        vim.opt.cursorline = true
    end,
})

-- keymaps
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
    callback = function()
        vim.cmd([[
         nnoremap <silent> <buffer> q :close<CR>
         set nobuflisted
            ]])
    end,
})
