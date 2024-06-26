return {
	-- COLORSCHEME --
	--
	-- catppuccin (main colorscheme)
	require("alex.plugins.colorscheme.catppuccin"),
	-- tokyonight
	require("alex.plugins.colorscheme.tokyonight"),
	-- github
	require("alex.plugins.colorscheme.github-theme"),
	-- rose pine
	require("alex.plugins.colorscheme.rose-pine"),
	-- kanagawa
	require("alex.plugins.colorscheme.kanagawa"),
	-- everforest
	require("alex.plugins.colorscheme.everforest"),
	-- zenbones
	require("alex.plugins.colorscheme.zenbones"),
	-- bluloco
	require("alex.plugins.colorscheme.bluloco"),
	-- patana
	require("alex.plugins.colorscheme.patana"),
	-- monochrome
	require("alex.plugins.colorscheme.monochrome"),
	-- gruvbox-material
	require("alex.plugins.colorscheme.gruvbox-material"),
	-- oxocarbon
	require("alex.plugins.colorscheme.oxocarbon"),

	-- full transparency
	require("alex.plugins.transparent"),


	--
	-- Git Integration --
	--
	require("alex.plugins.gitsigns"),
	require("alex.plugins.merginal"),
	require("alex.plugins.git-conflict"),

	--
	-- Language Server Protocol (LSP)
	--
	{
		"neovim/nvim-lspconfig",
		cmd = {
			"LspStart",
			"LspInfo",
			"Trouble",
			"Mason",
			"ConformInfo"
		},
		dependencies = {
			"stevearc/conform.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("alex.plugins.lsp.mason")
			require("alex.plugins.lsp.lspconfig")
		end
	},

	require("alex.plugins.diagflow"),
	require("alex.plugins.lsp.lsp-lens"),
	require("alex.plugins.outline"),

	--
	-- Auto completion
	--
	{
		"hrsh7th/nvim-cmp",
		event = { "CmdlineEnter", "InsertEnter" },
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"lukas-reineke/cmp-under-comparator",
			"onsails/lspkind.nvim",
			"rafamadriz/friendly-snippets"
		},
		config = function()
			require("alex.plugins.lsp.nvim-cmp")
		end
	},

	require("alex.plugins.conform"),
	require("alex.plugins.autoclose"),
	require("alex.plugins.lsp.cmp-spell"),

	--
	-- User Interface
	--
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("alex.plugins.lualine")
		end,
	},

	{
		"akinsho/bufferline.nvim",
		event = {
			"TabNew",
			"TabEnter"
		},
		config = function()
			require("alex.plugins.bufferline")
		end
	},

	require("alex.plugins.vim-illuminate"),
	require("alex.plugins.indent-blankline"),

	{
		"sitiom/nvim-numbertoggle",
		enabled = true,
		event = "VeryLazy",
	},

	require("alex.plugins.dashboard"),
	require("alex.plugins.zen-mode"),
	require("alex.plugins.notify"),
	require("alex.plugins.nvim-tree"),
	require("alex.plugins.oil"),
	require("alex.plugins.fzf-lua"),
	require("alex.plugins.trouble"),
	require("alex.plugins.dadbod-ui"),
	require("alex.plugins.todo-comments"),
	require("alex.plugins.treesitter"),
	require("alex.plugins.treesitter-context"),

	{
		"mtdl9/vim-log-highlighting",
		ft = "log"
	},

	{
		"gregsexton/MatchTag",
		event = "VeryLazy",
		ft = { 'markdown', 'html', 'php', 'xml', 'javascript' },
	},


	--
	-- Uncategorized
	--
	require("alex.plugins.comment"),
	require("alex.plugins.early-retirement"),
	require("alex.plugins.nvim-tmux-navigation"),
	require("alex.plugins.guess-indent"),

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end
	},

	require("alex.plugins.live-server"),
	require("alex.plugins.marp"),
	require("alex.plugins.jaq-nvim"),
	require("alex.plugins.ccc"),

	{
		"nullchilly/fsread.nvim",
		cmd = { "FSRead", "FSToggle" }
	},

	require("alex.plugins.markdown-preview"),
	require("alex.plugins.vim-rest-console"),
	require("alex.plugins.codesnap"),
	require("alex.plugins.rayso"),
	require("alex.plugins.treesj"),
	require("alex.plugins.precognition"),
	require("alex.plugins.screenkey"),
	require("alex.plugins.markdown-nvim")
}
