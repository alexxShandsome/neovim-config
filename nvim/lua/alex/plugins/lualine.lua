local lualine = require("lualine")

-- rename mode names to shorter ones
local mode_map = {
	n = "N",
	nt = "N",
	i = "I",
	R = "R",
	v = "V",
	V = "VL",
	no = "CHA",
	["\22"] = "VB",
	t = "T",
	['!'] = "SH",
	c = "C",
	s = "SUB"
}

lualine.setup {
	options = {
		icons_enabled = true,
		-- theme = 'molokai',
		-- theme = 'horizon',
		theme = "auto",
		component_separators = "",
		section_separators = {
			right = ""
		},
		disabled_filetypes = {
			statusline = {
				"NvimTree",
				"tagbar",
				"merginal",
				"packer",
				"Outline",
				"oil",
				"Trouble"
			},
			winbar = {
				"NvimTree",
				"tagbar",
				"merginal",
				"fugitive",
				"packer",
				"netrw",
				"Outline",
				"text",
				"log",
				"help",
				"Jaq",
				"qf",
				"Trouble",
				"oil",
				"man"
			},
		},
		ignore_focus = {},
		always_divide_middle = false,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},

	sections = {
		lualine_a = {
			{
				"mode",
				icons_enabled = true,
				separator = {
					right = ""
				},
				fmt = function()
					return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode
				end
			},
		},
		lualine_b = {
			{
				"branch",
				color = {
					bg = "#66d9ef",
					fg = "#1a1b26"
				},
				icons_enabled = true,
				separator = {
					right = ""
				},
			},
			{
				"diff",
				colored = true,
				symbols = {
					-- added = "+",
					-- modified = "~",
					-- removed = "-",
					added = "󰐖 ", -- nf-md-plus_box
					modified = "󱗜 ", -- nf-md-circle_box
					removed = "󰍵 ", -- nf-md-minus_box
				},
				separator = {
					right = ""
				},
				source = nil,
			},
			{
				"filename",
				path = 0,
				separator = {
					right = ''
				},
				symbols = {
					modified = "●",
					readonly = "[RO]"
				}
			},
		},
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", },
				symbols = {
					error = "󰅙 ",
					warn = "󰀦 ",
					info = "󰋼 ",
				},
				colored = true,
				update_in_insert = false,
				always_visible = false,
				separator = {
					right = ''
				}
			},
			{ require("dr-lsp").lspCount },
			{ require("dr-lsp").lspProgress },
		},
		lualine_x = {},
		lualine_y = { "encoding", "filetype", "progress" },
		lualine_z = {
			{
				"location",
				separator = {
					left = "",
				}
			}
		}
	},

	inactive_sections = {
		lualine_a = {
			{
				"filename",
				path = 0,
				separator = {
					right = ''
				},
				symbols = {
					modified = "●",
					readonly = "[RO]"
				}
			},
			{
				"diff",
				colored = true,
				symbols = {
					-- added = "+",
					-- modified = "~",
					-- removed = "-",
					added = "󰜄 ", -- nf-md-plus_box_outline
					modified = "󱗝 ", -- nf-md-circle_box_outline
					removed = "󰛲 ", -- nf-md-minus_box_outline
				},
				separator = {
					right = ""
				},
				source = nil,
			},
		},
		lualine_b = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", },
				symbols = {
					error = "󰅚 ",
					warn = "󰀪 ",
					info = "󰋽 ",
				},
				colored = true,
				update_in_insert = false,
				always_visible = false,
				separator = {
					right = ""
				}
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{ "filetype", }
		},
		lualine_z = {
			{
				"location",
				separator = {
					left = "",
				},
			}
		}
	},

	winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			-- { "navic" }
		},
		lualine_x = {
			-- {
			-- 	"diagnostics",
			-- 	sources = { "nvim_workspace_diagnostic" },
			-- 	sections = { "error", "warn", "info", "hint" },
			-- 	symbols = {
			-- 		error = "󰅙 ",
			-- 		warn = "󰀦 ",
			-- 		info = "󰋼 ",
			-- 		hint = "󰌵 "
			-- 	},
			-- 	colored = true,
			-- 	update_in_insert = false,
			-- 	always_visible = true,
			-- }
		},
		lualine_y = {},
		lualine_z = {}
	},

	inactive_winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			-- { "navic" },
		},
		lualine_x = {
			-- {
			-- 	"diagnostics",
			-- 	sources = { "nvim_workspace_diagnostic" },
			-- 	sections = { "error", "warn", "info", "hint" },
			-- 	symbols = {
			-- 		error = "󰅚 ",
			-- 		warn = "󰀪 ",
			-- 		info = "󰋽 ",
			-- 		hint = "󰌶 ",
			-- 	},
			-- 	colored = true,
			-- 	update_in_insert = false,
			-- 	always_visible = true,
			-- }
		},
	},

	extensions = {}
}
