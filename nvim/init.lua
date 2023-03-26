vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("alex.core.autocmds")
require("alex.core.keymaps")
require("alex.core.options")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("alex.plugins.nvim-tree")
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		}
	},

	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = function()
			require("alex.plugins.treesitter")
			require("alex.plugins.treesitter-context")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context"
		}
	},

	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("alex.plugins.catppuccin")
			vim.cmd.colorscheme "catppuccin"
		end
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"SmiteshP/nvim-navic"
		},
		config = function()
			require("alex.plugins.lsp.mason")
			require("alex.plugins.lsp.lspconfig")
			require("alex.plugins.lsp.nvim-cmp")
		end
	},

	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("alex.plugins.lualine")
		end
	},

	{
		"akinsho/bufferline.nvim",
		config = function()
			require("alex.plugins.bufferline")
		end
	},

	{
		"RRethy/vim-illuminate",
		config = function()
			require("alex.plugins.vim-illuminate")
		end
	},

	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		dependencies = {
			"junegunn/fzf"
		}
	},

	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
		cond = function()
			local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
			return git_dir ~= ""
		end,
	},

	{
		"davidgranstrom/nvim-markdown-preview",
		ft = "markdown",
	},

	{
		"nullchilly/fsread.nvim",
		cmd = {'FSRead', 'FSToggle'}
	},

	{
		"manzeloth/live-server",
		cmd = {'LiveServer'}
	},

	{
		"idanarye/vim-merginal",
		dependencies = {
			"tpope/vim-fugitive",
		},
		cond = function()
			local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
			return git_dir ~= ""
		end,
		cmd = {'Merginal', 'MerginalToggle', 'Git'}
	},

	{
		"gorbit99/codewindow.nvim",
		config = function()
			require("alex.plugins.codewindow")
		end,
		cmd = {'CWToggle', 'CWOpen'}
	},

	{
		"mtdl9/vim-log-highlighting",
		ft = {'log'}
	},

	{
		"windwp/nvim-ts-autotag",
		ft = {'markdown', 'html', 'php', 'xml', 'javascript'},
		dependencies = {
			"AndrewRadev/tagalong.vim",
			"gregsexton/MatchTag",
		}
	},

	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("alex.plugins.symbols-outline")
		end,
		cmd = {'SymbolsOutline', 'SymbolsOutlineOpen'}
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("alex.plugins.indent-blankline")
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function ()
			require("Comment").setup()
		end
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end
	},

	"christoomey/vim-tmux-navigator",
	"sitiom/nvim-numbertoggle",

	{
		"Bekaboo/deadcolumn.nvim",
		config = function ()
			require("deadcolumn").setup({
				warning = {
					alpha = 0.3,
					colorcode = "#F38BA8",
				}
			})
		end
	}

})
