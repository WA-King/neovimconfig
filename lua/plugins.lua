vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    --Packer can manage itself
    use 'wbthomason/packer.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'kevinhwang91/rnvimr'
    use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
    use {'akinsho/bufferline.nvim'}
	use {
  		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {'neovim/nvim-lspconfig'}
	use {'williamboman/nvim-lsp-installer'}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lua'
		},
	}
	use {"L3MON4D3/LuaSnip"}
	use "lukas-reineke/indent-blankline.nvim"
	use 'folke/tokyonight.nvim'

end)
