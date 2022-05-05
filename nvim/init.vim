call plug#begin()
	" Language
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'vim-test/vim-test'
	Plug 'j-hui/fidget.nvim'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'rafamadriz/friendly-snippets'
	" For vsnip users.
	" Plug 'hrsh7th/cmp-vsnip'
	" Plug 'hrsh7th/vim-vsnip'
	Plug 'windwp/nvim-autopairs'
	Plug 'numToStr/Comment.nvim'

	" View 
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'martinsione/darkplus.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'lukas-reineke/indent-blankline.nvim'
	
	" Navigation
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
	Plug 'karb94/neoscroll.nvim'
   Plug 'akinsho/bufferline.nvim'
	Plug 'preservim/tagbar'

	" Git
	Plug 'ThePrimeagen/git-worktree.nvim'
	Plug 'TimUntersberger/neogit'
	Plug 'lewis6991/gitsigns.nvim'
	
call plug#end()

lua << EOF
	require "user.options"
	require "user.keymaps"
	require "user.lualine"
	require "user.treesitter"
	require "user.bufferline"
	require "user.devicons"
	require "user.tree"
	require "user.neoscroll"
	require "user.luasnip"
	require "user.lsp"
	require "user.cmp"
	require "user.telescope"
	require "user.test"
	require "user.neogit"
	require "user.iblankline"
	require "user.fidget"
	require "user.gitsigns"
	require "user.autopairs"
	require "user.comment"
EOF
