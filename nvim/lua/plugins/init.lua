vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("j-hui/fidget.nvim")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("ray-x/lsp_signature.nvim")
	use("chr4/nginx.vim")
	use("MunifTanjim/prettier.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("folke/neodev.nvim")

	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use("rcarriga/nvim-dap-ui")
	use("nvim-neotest/neotest")
	use("nvim-neotest/neotest-go")

	-- Base
	use("folke/todo-comments.nvim")
	use("akinsho/toggleterm.nvim")
	use("antoinemadec/FixCursorHold.nvim")
	use("folke/which-key.nvim")

	-- View
	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("lukas-reineke/indent-blankline.nvim")
	use("Mofiqul/vscode.nvim")

	-- Navigation
	use("kyazdani42/nvim-tree.lua")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("karb94/neoscroll.nvim")
	use("akinsho/bufferline.nvim")
	use("preservim/tagbar")
	use("phaazon/hop.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Edit
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
end)
